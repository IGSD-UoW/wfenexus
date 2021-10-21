# Strings translations.

# Edit the strings between "", making sure to preserve the double ".



# Menus -------------------------------------------------------------------

overview_menu <- "Overview"
food_menu <- "Food"
water_menu <- "Water"
energy_menu <- "Energy"
considerations_menu <- "Definitions and considerations"

distribution_menu <- "Distribution"
description_menu <- "Description"

# General -----------------------------------------------------------------

parents_string <- "Parents"
children_string <- "Children"
kindergarten_string <- "Kindergarten"

rating_avg_string <- "Average rating"
water_footprint_string <- "Water Footprint"

# Overview ----------------------------------------------------------------

# Value boxes.
num_kindergartens <- "Kindergartens involved in the project."
num_dishes <- "Number of dishes."
num_ingredients <- "Number of ingredients."
num_votes <- "Number of dish ratings."

# Table and filters -------------------------------------------------------

name_string <- "Name"
calories_string <- "Calories"
waste_string <- "Waste"
allergen_string <- "Allergens"

ingredient_string <- "Ingredient"

meal_type_string <- "Type"

produced_locally_string <- "Produced locally?"


rating_children_string <- "Rating (Children)"
rating_parents_string <- "Rating (Parents)"
rating_average_string <- "Rating (Average)"

health_string <- "Perceived health"
health_string_long <-  "Average of parents' ratings on perceived health. High values do not necessarily mean that the meal is healthy."

water_used_string <- "Used Water"
water_used_tooltip <- "Total Water Used, resulting from summing every ingredient's waterfootprint based on their place of production multiplyied by their amount of grams. **Units: m3**"


emissions_transport_string <- "Transport emissions"

co2_emissions_string <- "TonCO2 Emitted"
co2_emissions_string_long <- "Total of CO2 Tonnes emitted in transportation, based on the origin of the ingredients and means of transport. **Units: TonCO2e**"

from_producer_string <- "Produced in Poland?"

weight_string <- "Weight (g)"




# Food --------------------------------------------------------------------

total_gr_animals <- "used in ingredients from livestock origin"
total_gr_crops <- "used in ingredients from crops origin"

food_description <- paste0(
  "The water footprint of food preparation is not only the water we use to prepare the food. It represents the amount of water used in all stages of food production.\n
  blue water footprint - water taken from surface and underground sources, used for example in agriculture for irrigation or for washing fruit and vegetables and cooking
  green water footprint - refers to rainwater collected in the soil layer in the plant root zone, which is necessary for plant growth
  grey water footprint refers to water which is necessary to dissolve the pollutants generated during the production process at least to the level of the quality standards in force.
  ")




# Plots
top5_kindergartens_title <- "Top 5 kindergartens by food rating"
top5_kindergartens_subtitle <- "Based on the average ratings made by parents and children"

top5_breakfast_title <-"Top 5 breakfast dishes by food rating"
top5_afternoon_title <- "Top 5 afternoon tea dishes"

ing_usg_wft_title <- "Ingredients' usage vs. water footprint"
ing_usg_wft_subtitle <- ""
ing_usg_wft_x <- "Total weight (g)"
ing_usg_wft_y <-"Avg. Water Footprint (m3/Ton)"
ing_usg_wft_color <- "Type of food"

comparison_ratings_title <- "Comparison of rating made by parents and children"
comparison_ratings_subtitle <- top5_kindergartens_subtitle

rating_health_title <- "Average rating vs perceived health"
rating_health_x <- "Average rating"
rating_health_y <- "Perceived health"



# Water -------------------------------------------------------------------

vb_avg_water_animals_string <- "is the average water footprint of livestock farming worldwide"
vb_avg_water_crops_string <- "is the average water footprint of crops worldwide"
vb_avg_water_animals_local_string <- "is the average water footprint of livestock farming, locally"
vb_avg_water_crops_local_string <- "is the average water footprint of crops locally (if possible)"

vb_tot_water_animals_string <- "is the total water footprint of livestock farming worldwide"
vb_tot_water_crops_string <- "is the total water footprint of crops worldwide"
vb_tot_water_animals_local_string <- "is the total water footprint of livestock farming, locally"
vb_tot_water_crops_local_string <- "is the total water footprint of crops locally (if possible)"



vb_total_water_string <- "is the total water footprint of the ingredients from animal origin"

water_world_string <- "Water footprint (World)"
water_world_tooltip <- "Total water needed using world averages, resulting from summing all ingredient's total water footprint. **Units: m3**. _This measure is just for comparison purposes only, and does not reflect actual ingredients' origin_."

water_local_string <- "Water footprint (Poland)"
water_local_tooltip <- "Total water needed if all ingredients were produced locally (if possible), resulting from summing all ingredient's total water footprint. **Units: m3**. _This measure is just for comparison purposes only, and does not reflect actual ingredients' origin_."

water_used_string <- "Water Used"
water_used_tooltip <- "Total water used, based on the actual origin of the ingredients. Results from the sum of ingredients' actual footprint.**Units: m3**"


water_saving_string <- "Water Saving"
water_saving_tooltip <- "Difference between the current choice of ingredients compared to the same ingredients using world averages. Negative values mean reduction of water and, therefore, are desirable."

water_blue_string <- "Blue"
water_blue_tooltip <- "Blue water footprint is water that has been sourced from surface or groundwater resources and is either evaporated, incorporated into a product or taken from one body of water and returned to another, or returned at a different time. Irrigated agriculture, industry and domestic water use can each have a blue water footprint. **Units in m3/Ton**"

water_grey_string <- "Grey"
water_grey_tooltip <- "Grey water footprint is the amount of fresh water required to assimilate pollutants to meet specific water quality standards. The grey water footprint considers point-source pollution discharged to a freshwater resource directly through a pipe or indirectly through runoff or leaching from the soil, impervious surfaces, or other diffuse sources. **Units in m3/Ton**"

water_total_string <- "Total"
water_total_tooltip <- "Total water footprint, resulting from the sum of Green, Blue and Grey water footprint. **Units in m3/Ton**"



wfp_avg_string <- "Water Footprint (Avg)"
wfp_avg_tooltip <- "Total Water Footprint, using world averages. **Units: m3/Ton**"

wfp_poland_string <- "Water Footprint (PL)"
wfp_poland_tooltip <- "Total Water Footprint, assuming it was produced in Poland. **Units: m3/Ton**"

water_saving_potential_string <- "Potential water Saving"
water_saving_potential_tooltip <- "Difference between the current choice of ingredients compared to the same ingredients being produced locally. Higher values represent greater room for improvement."


water_green_string <- "Green"
water_green_tooltip <- "Green water footprint is water from precipitation that is stored in the root zone of the soil and evaporated, transpired or incorporated by plants. It is particularly relevant for agricultural, horticultural and forestry products. **Units in m3/Ton**"

water_blue_string <- "Blue"
water_blue_tooltip <- "Blue water footprint is water that has been sourced from surface or groundwater resources and is either evaporated, incorporated into a product or taken from one body of water and returned to another, or returned at a different time. Irrigated agriculture, industry and domestic water use can each have a blue water footprint. **Units in m3/Ton**"

water_grey_string <- "Grey"
water_grey_tooltip <- "Grey water footprint is the amount of fresh water required to assimilate pollutants to meet specific water quality standards. The grey water footprint considers point-source pollution discharged to a freshwater resource directly through a pipe or indirectly through runoff or leaching from the soil, impervious surfaces, or other diffuse sources. **Units in m3/Ton**"

water_total_string <- "Total"
water_total_tooltip <- "Total water footprint, resulting from the sum of Green, Blue and Grey water footprint. **Units in m3/Ton**"



wfp_avg_string <- "Water Footprint (Avg)"
wfp_avg_tooltip <- "Total Water Footprint, using world averages. **Units: m3/Ton**"

wfp_poland_string <- "Water Footprint (PL)"
wfp_poland_tooltip <- "Total Water Footprint, assuming it was produced in Poland. **Units: m3/Ton**"

# Energy ------------------------------------------------------------------

vb_truck_emissions_string <- "are emitted to the atmosphere per km by truck"
vb_train_emissions_string <- "are emitted to the atmosphere per km by train"
vb_ferry_emissions_string <- "are emitted to the atmosphere per km by ferry"
vb_plane_emissions_string <- "are emitted to the atmosphere per km by plane"

comparison_rating_energy_title <- "Comparison of rating vs energy footprint"

