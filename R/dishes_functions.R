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
#' @param df Dataframe with raw dishratings, directly retrieved from the tool.
#' @return Clean and tidy dataset with dish ratings information.
ci_dishratings_prep <- function(df) {

  df <- df %>%
    mutate(id = as.integer(id)) %>%
    filter(!is.na(id)) %>%
    filter(!is.na(kindergarten_id)) %>%
    filter(!is.na(date)) %>%
    # mutate(date = lubridate::dmy(date)) %>%
    mutate(across(c("children_satisfaction","parent_satisfaction", "health"),
                  ~recode(., one = 1, two = 2, three = 3, four = 4, five = 5))) %>%
    rowwise() %>%
    mutate(avg_satisfaction =
             mean(c_across(c(children_satisfaction, parent_satisfaction)),
                  na.rm = TRUE),
           .after = "parent_satisfaction")

  df <- df %>%
    rename(kindergarten = kindergarten_label,
           dish = dish_label) %>%
    mutate(kindergarten_id = as.factor(kindergarten_id),
           kindergarten = as.factor(kindergarten),
           dish = as.factor(dish)) %>%


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
              rating_average = mean(avg_satisfaction),
              health = mean(health)) %>%
    mutate(across(where(is.numeric), round, 2))

  dishes <- dishes %>%
    left_join(dishratings, by = c("id" = "dish_id"))

  return(dishes)

}
