# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


#' Reads and cleans crops' water footprint dataset.
#' @description Reads and cleans crops' water footprint dataset from
#'   https://waterfootprint.org/en/resources/waterstat/product-water-footprint-statistics/
#'    and converts it to tidy format.
#' @param filename String with the XLSX file name containing the water
#'   footprint. File should be stored in data/data-raw folder.
#' @param sheetname String with the name of the Excel's sheet to be imported.
#' @param skip_rows Number containing the number of rows to be skipped when
#'   importing the XLSX data.
#' @param country String with the country name we want to get water footprint
#'   from.
#' @return Dataframe in a tidy format, providing values for the selected country
#'   only.
ci_wf_prep_crops <- function(filename = "Report47-Appendix-II.xlsx",
                             sheetname ="App-II-WF_perTon", skip_rows = 3,
                             country = NULL) {

  df <- readxl::read_excel(
    here::here(paste0("inst/extdata/water_footprint/", filename)),
    sheet = sheetname, skip = skip_rows) %>%
    janitor::clean_names() %>%
    # Drop country-specific data for countries other than Poland.
    select(1:10, starts_with(tolower(country))) %>%
    # Renames columns with values from first row.
    janitor::row_to_names(row_number = 1) %>%
    janitor::clean_names() %>%
    # Manually add a row name.
    rename(wf_type = province_state) %>%
    # Remove first row: does not contain data.
    slice(-(1)) %>%
    # Replaces NA values with previous !is.na(value) for selected columns.
    mutate(across(c(product_code_faostat, product_code_hs, product_code_sitc,
                    product_description_hs, product_description_faostat,
                    root_product_hs, product_fraction_pf, value_fraction_vf,
                    wf_type),
                  zoo::na.locf)) %>%
    mutate(across(c(product_code_faostat, product_code_hs, product_code_sitc,
                    product_description_hs, product_description_faostat,
                    root_product_hs, wf_type),
                  as.factor)) %>%
    mutate(across(where(is.character), as.numeric))

  return(df)



  # References --------------------------------------------------------------

  # https://foodprint.org/issues/the-water-footprint-of-food/
  # https://www.waterfootprint.org/media/downloads/Hoekstra-2008-WaterfootprintFood.pdf

}


#' Reads and cleans animals' water footprint dataset.
#' @description Reads and cleans animals' water footprint dataset from
#'   https://waterfootprint.org/en/resources/waterstat/product-water-footprint-statistics/
#'    and converts it to tidy format.
#' @param filename String with the XLSX file name containing the water
#'   footprint. File should be stored in data/data-raw folder.
#' @param sheetname String with the name of the Excel's sheet to be imported.
#' @param skip_rows Number containing the number of rows to be skipped when
#'   importing the XLSX data.
#' @param country String with the country name we want to get water footprint
#'   from.
#' @return Dataframe in a tidy format, providing values for the selected country
#'   only.
ci_wf_prep_animals <- function(filename = "Report48-Appendix-V.xlsx",
                               sheetname ="App-V_WF_HS_SITC", skip_rows = 2,
                               country = NULL) {

  df <- readxl::read_excel(
    here::here(paste0("inst/extdata/water_footprint/", filename)),
    sheet = sheetname, skip = skip_rows) %>%
    janitor::clean_names() %>%
    # Renames merged cells with world data.
    rename(world_grazing = world_average,
           world_mixed = x11,
           world_industrial = x12,
           world_wgt_avg = x13) %>%
    # Drop country-specific data for countries other than Poland.
    select(1:13, starts_with(tolower(country))) %>%
    # Renames columns (quick and dirty solution)
    # @TODO:  Do this programatically. Unfortunately, I haven't been able to make
    # this work:
    # rename(paste0("poland", "_grazing") = 14,
    #        paste0("poland", "_mixed") = 15,
    #        paste0("poland", "_industrial") = 16,
    #        paste0("poland", "_wgt_avg") = 17)
    rename(country_grazing = 14,
           country_mixed = 15,
           country_industrial = 16,
           country_wgt_avg = 17) %>%
    # Remove first row: does not contain data.
    slice(-(1)) %>%
    # Replaces NA values with previous !is.na(value).
    zoo::na.locf() %>%
    # Manually add a row name.
    rename(wf_type = country) %>%
    mutate(across(c(hs_pc_tas_code, sitc_rev_3_sita_code, product_discription_hs,
                    product_description_sitc, rootproduct_hs, rootproduct_sitc,
                    wf_type),
                  as.factor)) %>%
    mutate(across(where(is.character), as.numeric))

  return(df)



  # References --------------------------------------------------------------

  # https://foodprint.org/issues/the-water-footprint-of-food/
  # https://www.waterfootprint.org/media/downloads/Hoekstra-2008-WaterfootprintFood.pdf

}

#' Prepares dishrating dataset.
#' @description Reads file containing dishrating dataset, cleans data and
#'   calculates average ratings per dish.
#' @param filename String pointing to file containing dish ratings' dataset.
#' @return Clean and tidy dataset with dish ratings information.
ci_dishratings_prep <- function(filename) {


  df <- read_delim(filename, delim = ";") %>%
    mutate(id = as.integer(id)) %>%
    filter(!is.na(id)) %>%
    filter(!is.na(date)) %>%
    mutate(date = dmy(date)) %>%
    mutate_at(c("children_satisfaction","parent_satisfaction", "health"),
              funs(recode(., one = 1, two = 2, three = 3, four = 4, five = 5)))

  return(df)

}

#' Returns average ratings per dish.
#' @description Reads dishrating dataset, calculates average ratings per dish
#'   and aggregates that information to dishes' dataset.
#' @param dishratings Dataset containing dish ratings.
#' @param dishes Dataframe containing information regarding
#' @return Dishes dataframe with new columns, containing average ratings.
ci_dishratings <- function(dishes, dishratings) {


  dishratings <- dishratings %>%
    group_by(dish_id) %>%
    summarize(rating_children = mean(children_satisfaction),
              rating_parents = mean(parent_satisfaction),
              health = mean(health)) %>%
    mutate(across(where(is.numeric), round, 2))

  dishes <- dishes %>%
    left_join(dishratings, by = c("id" = "dish_id"))

  return(dishes)

}
