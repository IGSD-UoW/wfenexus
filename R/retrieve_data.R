#' Retrieves data from the tool and stores it a dataframe.
#' @description Retrieves json data from a url and converts it into a dataframe.
#'   Optionally, stores it in a CSV file.
#' @param json String pointing to a JSON's URL from the tool.
#' @param filename String containing the filename to store a csv.
#' @return Dataframe.
ci_get_data <- function(json, filename = NULL) {
  df <- as.data.frame(fromJSON(json)[["list"]])

  if (!is.null(filename)) {
    write_csv(df, file = here::here("slupsk/data-raw/", filename))
  }

  return(df)
}
