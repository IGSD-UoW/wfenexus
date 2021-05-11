# Generates the required datasets for the visualisations.

library(wfenexus)


# Variables ---------------------------------------------------------------

sel_country <- "Poland"
calc_wf <- FALSE


# Generate waterfootprint files. ------------------------------------------

if (calc_wf == TRUE) {
  water_fp_crops <- ci_wf_prep_crops("Report47-Appendix-II.xlsx",
                                     skip_rows = 3, country = sel_country)

  write.csv(water_fp_crops, file = here::here("slupsk/data/wf_crops.csv"),
            row.names=FALSE)


  water_fp_animals <- ci_wf_prep_animals("Report48-Appendix-V.xlsx",
                                         country = sel_country)

  write.csv(water_fp_animals, file = here::here("slupsk/data/wf_animals.csv"),
            row.names=FALSE)
}


# Cleanup -----------------------------------------------------------------

base::remove(sel_country)
base::remove(calc_wf)


# Adds wf to ingredients --------------------------------------------------

ingredients_df <- read_csv(here::here("slupsk/data-raw/ingredient_ingredient.csv"))


water_fp_crops <- read_csv(here::here("slupsk/data/wf_crops.csv")) %>%
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


water_fp_animals <- read_csv(here::here("slupsk/data/wf_animals.csv")) %>%
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
water_fp_animals <- water_fp_animals %>%
  select(-hs_pc_tas_code, -starts_with("sitc_rev"),
        -starts_with("rootproduct_"),
        -product_fraction_pf,
        -value_fraction_vf)

ingredients_df <- read_csv(
  here::here("slupsk/data-raw/ingredient_ingredient.csv")) %>%
  left_join(water_fp_crops, by = c("name_en" = "product_description_hs")) %>%
  left_join(water_fp_animals, by = c("name_en" = "product_description_hs"))

# TODO: split the join in two tmp dataframes. then append the crops with the animals.

# TODO: create a function to merge water footprint only from crops and animals
# with ingredients.

