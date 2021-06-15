#' Create horizontal barplots.
#' @description Creates a horizontal barplot using ggplot.
#' @param df Regular Dataframe
#' @param my_category Category that will be used for classification. Can be a
#'   vector.
#' @param my_title String that will be used for Plot's title.
ci_barplot_horizontal <- function(df, my_category, my_title, my_facet = NULL,
                                  my_palette = "Paired") {

  my_category <- enquo(my_category)
  my_facet <- enquo(my_facet)

  if (is.null(my_facet)) {
    df <- df %>%
      filter(!! my_category != "") %>%
      group_by(!! my_category)
  } else {

    df <- df %>%
      filter(!! my_category != "") %>%
      group_by(!! my_facet, !! my_category)
  }

  df <- df %>%
    summarise(total = n()) %>%
    mutate(percent = percent(round(total/sum(total), digits = 2))) %>%
    arrange(desc(total)) %>%
    mutate(order = "1")

  # View(df)

  if (!is.null(my_facet)) {
    p <- ggplot(df, aes_q(x = quote(order), y = quote(total), fill = my_category)) +
      geom_bar(stat = "identity", position = "fill") +
      geom_text(aes(label = total),
                colour = "white",
                position = position_fill(vjust = 0.5)) +
      scale_y_continuous(labels = percent(c(0, 0.25, 0.5, 0.75, 1))) +
      facet_wrap(as.formula(paste("~", my_facet)), ncol = 1) +
      ggtitle(my_title) +
      labs(x = "", y = "", fill = "") +
      scale_fill_brewer(palette = my_palette, direction = -1) +
      theme_minimal() +
      theme(axis.text.y = element_blank()) +
      theme(legend.position = "bottom") +
      guides(fill=guide_legend(ncol=2)) +
      coord_flip()
  } else {
    p <- ggplot(df, aes_q(x = quote(order), y = quote(total), fill = my_category)) +
      geom_bar(stat = "identity", position = "fill") +
      geom_text(aes(label = total),
                colour = "white",
                position = position_fill(vjust = 0.5)) +
      scale_y_continuous(labels = percent(c(0, 0.25, 0.5, 0.75, 1))) +
      ggtitle(my_title) +
      labs(x = "", y = "", fill = "") +
      scale_fill_brewer(palette = my_palette, direction = -1) +
      theme_minimal() +
      theme(axis.text.y = element_blank()) +
      theme(legend.position = "bottom") +
      guides(fill=guide_legend(ncol=2)) +
      coord_flip()
  }

  print(p)

}
