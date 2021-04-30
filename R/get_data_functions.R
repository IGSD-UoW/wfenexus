# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


#' Reads and cleans water footprint dataset.
#' @description Reads and cleans water footprint dataset from
#'   https://waterfootprint.org/en/resources/waterstat/product-water-footprint-statistics/
#'   and converts it to tidy format.
#' @param filename String with the XLSX file name containing the water
#'   footprint. File should be stored in data/data-raw folder.
#' @param sheetname String with the name of the Excel's sheet to be imported.
#' @param country String with the country name we want to get water footprint
#'   from.
#' @return Dataframe in a tidy format, providing values for the selected country
#'   only.
wf_data_prep <- function(filename, sheetname ="App-II-WF_perTon", country = NULL) {

  wf_df <- readxl::read_excel(
    here::here(paste0("data/data-raw/water_footprint/", filename)),
    sheet = sheetname, skip = 3) %>%
    janitor::clean_names() %>%
    # Drop country-specific data for countries other than Poland.
    select(1:10, starts_with(country)) %>%
    # Renames columns with values from first row.
    janitor::row_to_names(row_number = 1) %>%
    janitor::clean_names() %>%
    # Manually add a row name.
    rename(wf_type = province_state) %>%
    # Remove first row: does not contain data.
    slice(-(1)) %>%
    # Replaces NA values with previous !is.na(value).
    zoo::na.locf()

  return(wf_df)



  # References --------------------------------------------------------------

  # https://foodprint.org/issues/the-water-footprint-of-food/
  # https://www.waterfootprint.org/media/downloads/Hoekstra-2008-WaterfootprintFood.pdf

}


