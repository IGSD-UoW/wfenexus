# Reactable customisations.


#' Renders a bar chart with a label on the left.
#' @description Renders a bar chart with a label on the left.
#' @param value Cell's value.
#' @param variable dataframe's variable
#' @param color String containing color.
#' @param background String containing color to be used as background. Can be
#'   set to NULL if no background is needed.
#' @return Values aligned to the left and a barplot on its right.
rt_bar_cell = function(value, variable, color, background = "#e1e1e1") {
  if (!is.na(value)) {
    width <- paste0(value * 100 / max(variable, na.rm = TRUE), "%")
    value <- format(value, big.mark = ",")
    value <- format(value, width = 9, justify = "right")
    bar <- div(
      class = "bar-chart",
      style = list(marginRight = "6px", backgroundColor = background),
      div(class = "bar", style = list(width = width, backgroundColor = color))
    )
    div(class = "bar-cell", span(class = "number", value), bar)
  }
}

#' Changes header style when tooltips are enabled.
#' @description Adds text decoration to reactable's header, changes cursor type
#'   and shows a tooltip on header.
#' @param value Cell's value.
#' @param dishes Dataframe containing information regarding
#' @return A tooltip text, cursor change and header underline.
rt_with_tooltip <- function(value, tooltip) {
  tags$abbr(style = "text-decoration: underline; text-decoration-style: dotted; cursor: help",
            title = tooltip, value)
}


#' Displays ratings using icons.
#' @description Converts numeric values into an array of icons, ideal for
#'   ratings.
#' @param rating Number, from cell's value.
#' @param icon String containing the name of the icon to be used. Icons defined
#'   with shiny::icon()
#' @param color String containing color definition in hex format.
#' @param max_rating Number of maximum rating.
#' @return An array of n icons and a tooltip showing the original value.
rt_rating_icons <- function(rating, icon = "star", color = "orange", max_rating = 5) {
  if (!is.na(rating)) {
    star_icon <- function(empty = FALSE) {
      tagAppendAttributes(shiny::icon(icon),
                          style = paste("color:", if (empty) "#edf0f2" else color),
                          "aria-hidden" = "true"
      )}
    rounded_rating <- floor(rating + 0.5)  # always round up
    stars <- lapply(seq_len(max_rating), function(i) {
      if (i <= rounded_rating) star_icon() else star_icon(empty = TRUE)
    })
    label <- sprintf("%s out of %s stars", rating, max_rating)
    div(title = label, role = "img", stars)
  }
}
