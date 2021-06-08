# Generates the required datasets for the visualisations.

library(wfenexus)
# library(jsonlite)


# Variables ---------------------------------------------------------------

sel_country <- "Poland"
# Set TRUE if you want to generate a tidy Waterfootprint dataset for selected
# country to be generated. Otherwise, it will read a csv file containing a
# previously generated dataset, saving time.
calc_wf <- FALSE

# Set TRUE if you want to download latest data from the tool. Otherwise, local
# files will be used.
retrieve_data <- TRUE


url_kindergartens <- "https://creatinginterfaces.demo.52north.org/slupsk-tool/kindergartens.json"
url_ingredients <- "https://creatinginterfaces.demo.52north.org/slupsk-tool/ingredients.json"
url_dishes <- "https://creatinginterfaces.demo.52north.org/slupsk-tool/kindergartendishs.json"
url_ratings <- "https://creatinginterfaces.demo.52north.org/slupsk-tool/dishratings.json"
url_producers <- "https://creatinginterfaces.demo.52north.org/slupsk-tool/producers.json"

urls_all <- c(url_dishes, url_ingredients, url_kindergartens, url_producers,
              url_ratings)

# Download datasets -------------------------------------------------------

if (isTRUE(retrieve_data) ) {
  kindergartens <- ci_get_data(url_kindergartens, "kindergartens.csv")

  ingredients <- ci_get_data(url_ingredients, "ingredients.csv")

  dishrating_raw <- ci_get_data(url_ratings, "dishrating.csv")

  # dishes_nested <- as.data.frame(fromJSON(url_dishes)[["list"]])
  dishes_nested <- ci_get_data(url_dishes)

  dish_composition_raw <- dishes_nested %>%
    # unnest(compositions, names_repair = "universal")
    unnest(compositions, names_sep = ".") %>%
    select(id, starts_with("compositions."), -`compositions.@index`,
           -compositions.id) %>%
    rename(dish_id = id) %>%
    rename_with(~str_remove(., 'compositions.'))

  write_csv(dish_composition_raw, here::here("slupsk/data-raw/", "dishes_composition_raw.csv"))

  dishes_raw <- dishes_nested %>%
    select(-compositions)

  write_csv(dishes_raw, here::here("slupsk/data-raw/", "dishes.csv"))

}

# Generate waterfootprint files. ------------------------------------------

if (calc_wf == TRUE) {
  wfp_crops <- ci_wf_prep_crops("Report47-Appendix-II.xlsx",
                                     skip_rows = 3, country = sel_country)

  write.csv(wfp_crops, file = here::here("slupsk/data/wf_crops.csv"),
            row.names=FALSE)


  wfp_animals <- ci_wf_prep_animals("Report48-Appendix-V.xlsx",
                                         country = sel_country)

  write.csv(wfp_animals, file = here::here("slupsk/data/wf_animals.csv"),
            row.names=FALSE)
}


# Cleanup -----------------------------------------------------------------

base::remove(sel_country)
base::remove(calc_wf)


# Adds wf to ingredients --------------------------------------------------

ingredients_df <- read_csv(here::here("slupsk/data-raw/ingredients.csv"))


wfp_crops <- read_csv(here::here("slupsk/data/wf_crops.csv")) %>%
  select(-starts_with("product_code"), -root_product_hs, -product_fraction_pf,
         -value_fraction_vf) %>%
  select(1:4, starts_with("slupsk")) %>%
  rename(world = global_average) %>%
  pivot_wider(names_from = wf_type, values_from = c(world, slupsk)) %>%
  janitor::clean_names() %>%
  replace(is.na(.), 0) %>%
  mutate(world_total = world_green + world_blue + world_grey) %>%
  relocate(world_total, .after = world_grey) %>%
  mutate(slupsk_total = slupsk_green + slupsk_blue + slupsk_grey) %>%
  relocate(slupsk_total, .after = slupsk_grey) %>%
  replace(. == 0, NA) %>%
  rename(country_total = slupsk_total,
         country_green = slupsk_green,
         country_grey = slupsk_grey,
         country_blue = slupsk_blue)


wfp_animals <- read_csv(here::here("slupsk/data/wf_animals.csv")) %>%
  # select(-hs_pc_tas_code, -starts_with("sitc_rev"),
  #        -starts_with("rootproduct_")) %>%
  select(-ends_with("_grazing"), -ends_with("_industrial"),
         -ends_with("_mixed")) %>%
  rename(world = world_wgt_avg,
         country = country_wgt_avg) %>%
  pivot_wider(names_from = wf_type, values_from = c(world, country)) %>%
  janitor::clean_names() %>%
  mutate(world_total = world_green + world_blue + world_grey) %>%
  relocate(world_total, .after = world_grey) %>%
  mutate(country_total = country_green + country_blue + country_grey) %>%
  relocate(country_total, .after = country_grey)

# TODO: we can do a treemap here before deleting parent categories.
wfp_animals <- wfp_animals %>%
  select(-hs_pc_tas_code, -starts_with("sitc_rev"),
        -starts_with("rootproduct_"),
        -product_fraction,
        -value_fraction)
  # TODO: use column product_description_sitc as description. It has plenty of
  # duplicates, so then summarise average values for same values.


ingredients_dic <- read_csv("slupsk/data-raw/ingredients_dictionary.csv")

# TODO: create a function to merge water footprint only from crops and animals
# with ingredients.

tmp_wfp_crops <- wfp_crops %>%
  right_join(ingredients_dic, by = c("product_description_hs" = "name_wf")) %>%
  rename(name_wf = product_description_hs,
         description = product_description_faostat) %>%
  filter(!is.na(description)) %>%
  relocate(id, name, name_en, .before = name_wf) %>%
  distinct(name_en, .keep_all= TRUE) %>%
  mutate(type = "crops")


tmp_wfp_animals <- wfp_animals %>%
  right_join(ingredients_dic, by = c("product_description_hs" = "name_wf")) %>%
  rename(name_wf = product_description_hs,
         description = product_description_sitc) %>%
  filter(!is.na(description)) %>%
  relocate(id, name, name_en, .before = name_wf) %>%
  mutate(type = "animals")


tmp_wf_combined <- tmp_wfp_crops %>%
  union(tmp_wfp_animals) %>%
  select(-id, -name)

wfp_combined <- ingredients_df %>%
  select(-name, -label) %>%
  left_join(ingredients_dic, by = "id") %>%
  select(-name_wf) %>%
  left_join(tmp_wf_combined, by = "name_en")

write.csv(wfp_combined, file = "slupsk/data/wfp_combined.csv",
          row.names = FALSE)


# Cleanup -----------------------------------------------------------------

base::remove(tmp_wfp_crops)
base::remove(tmp_wfp_animals)
base::remove(tmp_wf_combined)


# Create a list of potentially local ingredients --------------------------

# Not all ingredients can be grown in Poland.
pot_local_ingredients <- wfp_animals %>%
  filter(!is.na(country_total)) %>%
  filter(country_total != 0)

write.csv(pot_local_ingredients, file = "slupsk/data/pot_local_ingredients.csv",
          row.names = FALSE)


# Meals rating -------------------------------------------------------------

dishrating <- read_csv("slupsk/data-raw/dishrating.csv") %>%
  ci_dishratings_prep()

dish_composition <- read_csv(
  here::here("slupsk/data-raw/dishes_composition_raw.csv")) %>%
  filter(!is.na(ingredient_id)) %>%
  left_join(wfp_combined, by = c("ingredient_id" = "id")) %>%
  select(-label) %>%
  mutate(wfp_total = if_else(from_producer == "yes" & !is.na(country_total),
                             country_total, world_total),
         # wfp_total = if_else(wfp_total == NA, world_total, NA),
         wfp_total_used = wfp_total * weight_grams / 1000000)

write_csv(dish_composition, "slupsk/data/dish_composition.csv")

wfp_dish <- dish_composition %>%
  # select(dish_id, wfp_total_used) %>%
  # group_by(dish_id) %>%
  count(dish_id, wt = wfp_total_used, sort = TRUE, name = "water_used")


dishes_raw <- read_csv("slupsk/data-raw/dishes.csv") %>%
  mutate(waste = as.factor(waste)) %>%
  mutate(waste = fct_recode(waste, "<5" = "less5_pl", "5<10" = "5to10_pl",
                            "11<25" = "11to25_pl", ">25" = "more25_pl")) %>%
  mutate(waste = fct_relevel(waste, "<5", "5<10", "11<25", ">25"))

dishes <- ci_dishratings(dishes_raw, dishrating) %>%
  left_join(wfp_dish, by = c("id" = "dish_id"))

# dishrating_summary <- dishrating %>%
#   group_by(dish_id) %>%
#   summarize(rating_children = mean(children_satisfaction),
#             rating_parents = mean(parent_satisfaction),
#             health = mean(health)) %>%
#   mutate(across(where(is.numeric), round, 2)) %>%
#   filter(!is.na(rating_parents) | !is.na(health))
#
# dishes <- dishes_raw %>%
#   left_join(dishrating_summary, by = c("id" = "dish_id"))

write_csv(dishes, file = "slupsk/data/dishes.csv")
