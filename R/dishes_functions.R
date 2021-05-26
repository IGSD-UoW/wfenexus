# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'



#' Prepares dishrating dataset.
#' @description Reads file containing dishrating dataset, cleans data and
#'   calculates average ratings per dish.
#' @param filename String pointing to file containing dish ratings' dataset.
#' @return Clean and tidy dataset with dish ratings information.
ci_dishratings_prep <- function(filename) {


  df <- read_csv(filename) %>%
    mutate(id = as.integer(id)) %>%
    filter(!is.na(id)) %>%
    filter(!is.na(kindergarten_id)) %>%
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
