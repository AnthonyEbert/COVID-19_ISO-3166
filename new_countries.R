library(dplyr)

# New countries no-breaking-spaces

johns_hopkins <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")$Country.Region

johns_hopkins <- johns_hopkins %>% 
  factor() %>%
  levels()

johns_hopkins <- gsub("\u00A0", " ", johns_hopkins, fixed = TRUE)

existing_names <- read.csv("JohnsHopkins-to-A3.csv")$Country.Region %>% as.character()

new_countries = johns_hopkins[!(johns_hopkins %in% existing_names)]
removed_countries = existing_names[!(existing_names %in% johns_hopkins)]

readr::write_lines(new_countries, path = "new_countries.txt")
readr::write_lines(removed_countries, path = "removed_countries.txt")
