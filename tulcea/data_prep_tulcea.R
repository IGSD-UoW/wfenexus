# Generates the required datasets for the visualisations.

library(wfenexus)


# Variables ---------------------------------------------------------------

sel_country <- "Romania"

# Set TRUE if you want to generate a tidy Waterfootprint dataset for selected
# country to be generated. Otherwise, it will read a csv file containing a
# previously generated dataset, which saves a considerable time.
calc_wf <- FALSE

# Set TRUE if you want to download latest data from the tool. Otherwise, local
# files will be used.
retrieve_data <- TRUE

# Food
url_salepoints <- "https://creatinginterfaces.demo.52north.org/tulcea-tool/salepoints.json"
url_storagepoints <- "https://creatinginterfaces.demo.52north.org/tulcea-tool/storagepoints.json"
url_producers <- "https://creatinginterfaces.demo.52north.org/tulcea-tool/producers.json"
url_consumers <- "https://creatinginterfaces.demo.52north.org/tulcea-tool/consumers.json"

urls_food <- c(url_salepoints, url_storagepoints, url_producers, url_consumers)

# Water
url_wsupplier <- "https://creatinginterfaces.demo.52north.org/tulcea-tool/watersuppliers.json"

# Energy
url_energyusages <- "https://creatinginterfaces.demo.52north.org/tulcea-tool/energyusages.json"



urls_all <- c(urls_food, url_wsupplier, url_energyusages)


# Download datasets -------------------------------------------------------

if (isTRUE(retrieve_data) ) {
  for (i in urls_all) {
    # TODO: replace in a single command with this regex: (https:\/\/creatinginterfaces\.demo\.52north\.org\/tulcea-tool\/)|(.json)
    name <- gsub("https://creatinginterfaces.demo.52north.org/tulcea-tool/", "", i)
    name <- gsub(".json", "", name)

    df <- ci_get_data(i) %>%
      select(-starts_with("geometry"),
             -starts_with("photo"))

    write_csv(df, paste0("tulcea/data/", name, ".csv"))
  }

}



df <- as.data.frame(fromJSON(url_salepoints)[["list"]])
df2 <- flatten(df)

