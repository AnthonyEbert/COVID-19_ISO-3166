library(dplyr)

# New countries

johns_hopkins <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")$Country.Region

johns_hopkins <- johns_hopkins %>% 
  factor() %>%
  levels()

existing_names <- read.csv("JohnsHopkins-to-A3.csv")$Country.Region %>% as.character()

x = johns_hopkins[!(johns_hopkins %in% existing_names)]

readr::write_lines(x, path = "new_countries.txt")


# New countries no-breaking-spaces

johns_hopkins <- gsub("\u00A0", " ", johns_hopkins, fixed = TRUE)

existing_names <- read.csv("JohnsHopkins-to-A3_no-breaking-spaces.csv")$Country.Region %>% as.character()

x = johns_hopkins[!(johns_hopkins %in% existing_names)]

readr::write_lines(x, path = "new_countries_no-breaking-spaces.txt")
