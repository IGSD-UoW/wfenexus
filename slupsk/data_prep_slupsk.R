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

water_fp_crops <- read_csv(here::here("slupsk/data/wf_crops.csv")) %>%
  select(-starts_with("product_code"))


water_fp_animals <- read_csv(here::here("slupsk/data/wf_animals.csv"))


ingredients_df <- read_csv(
  here::here("slupsk/data-raw/ingredient_ingredient.csv"))

# @TODO: create a function to merge water footprint only from crops and animals
# with ingredients.

