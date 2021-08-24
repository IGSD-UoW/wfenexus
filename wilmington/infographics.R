# Wilmington infographics.

library(emojifont)
library(waffle)
library(fontawesome)
library(extrafont)

# load.fontawesome(font = "Font Awesome 5 Free-Solid-900.otf")
# use this if things look odd in RStudio under Windows
loadfonts(device = "win")
font_import(pattern = 'Font Awesome')

data_waste <- c("Wasted Food" = 35, "Not wasted" = 65)


waffle(
  data_waste, rows = 4, title = "Your basic waffle chart",
  colors =  c("#636363", "#fee8c8"),
  xlab = "1 square == 1%",
  use_glyph = "shopping-basket"
)



# Waffle chart
waffle(
  data_waste,
  rows = 10 ,
  colors =  c("#636363", "#fee8c8"),
  xlab = "1 square == 1%",
  flip = TRUE
) +
  ggtitle("Some tilte") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 27, face = "bold"),
    legend.text = element_text(size = 15),
    legend.position = "bottom"
  ) +
  annotate("text", x = 4, y = 5, label = paste(data_waste[1], "%"))

ggplot(data_waste, )


xdf %>%
  count(parts, wt = vals) %>%
  ggplot(aes(label = parts, values = n)) +
  geom_pictogram(n_rows = 10, aes(colour = parts), flip = TRUE, make_proportional = TRUE) +
  scale_color_manual(
    name = NULL,
    values = c("#a40000", "#c68958", "#ae6056"),
    labels = c("Fruit", "Sammich", "Pizza")
  ) +
  scale_label_pictogram(
    name = NULL,
    values = c("apple-alt", "bread-slice", "pizza-slice"),
    labels = c("Fruit", "Sammich", "Pizza")
  ) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  theme_enhance_waffle() +
  theme(legend.key.height = unit(2.25, "line")) +
  theme(legend.text = element_text(size = 10, hjust = 0, vjust = 0.75))

