# Wilmington infographics.

library(wfenexus)
library(emojifont)
library(ggwaffle)
library(extrafont)


# Variables ---------------------------------------------------------------


# Colours
color_food <- "#95C448"
color_water <- "#00A9AE"
color_energy <- "#EBC11F"

color_background <- "#34767A"

color_wfp_blue <- "#65C6F0"
color_wfp_green <- "#A2D729"
color_wfp_grey <- "#8f8f98"

# Food waste consumer level -----------------------------------------------

waffle_data <- tibble(
  variable = rep(c("wasted Food", "Not wasted"), times = c(35, 65))
) %>%
  # Converts to waffle data. waffle_iron() can control number of rows and cols.
  waffle_iron(aes_d(group = variable)) %>%
  mutate(label = fontawesome("fa-shopping-basket"))

subtitle_string <- "On the consumer level, individuals in the U.S. throw out nearly 25% of the food they bring into their homes. This amounts to a whopping 20 pounds of edible food wasted every single month"

gg_waste_consumer <- ggplot(waffle_data, aes(x, y, colour = group)) +
  geom_text(aes(label=label), family='fontawesome-webfont', size=8) +
  labs(title= "Food waste in the USA",
       subtitle= str_wrap(subtitle_string, 100),
       x = "", y = "",
       caption = "Source: Dailycal.org (Data)") +
  coord_equal() +
  scale_colour_manual(
    values = c(color_food, "red")
  ) +
  # scale_colour_waffle() +
  # theme_void()
  theme_waffle()

gg_waste_consumer
