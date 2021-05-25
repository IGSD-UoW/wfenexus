# Generates the required datasets for the visualisations.

library(wfenexus)


# Variables ---------------------------------------------------------------

sel_country <- "Poland"
calc_wf <- FALSE


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

ingredients_df <- read_csv(here::here("slupsk/data-raw/ingredient_ingredient.csv"))


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
  distinct(name_en, .keep_all= TRUE)


tmp_wfp_animals <- wfp_animals %>%
  right_join(ingredients_dic, by = c("product_description_hs" = "name_wf")) %>%
  rename(name_wf = product_description_hs,
         description = product_description_sitc) %>%
  filter(!is.na(description)) %>%
  relocate(id, name, name_en, .before = name_wf)


tmp_wf_combined <- tmp_wfp_crops %>%
  union(tmp_wfp_animals) %>%
  select(-id, -name)

wfp_combined <- ingredients_df %>%
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
  filter(!is.na(country_total))

write.csv(pot_local_ingredients, file = "slupsk/data/pot_local_ingredients.csv",
          row.names = FALSE)
