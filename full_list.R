library(dplyr)

jh_fulllist <- read.csv("JohnsHopkins-to-A3_additional-countries.csv")

iban_fulllist <- read.csv("country_codes.csv") %>%
  select(-alpha2)

full_list <- full_join(jh_fulllist, iban_fulllist, by = "alpha3") %>%
  group_by(alpha3) %>%
  summarise(Country.Region.x = as.character(first(Country.Region.x)), Country.Region.y = as.character(first(Country.Region.y))) %>%
  group_by(alpha3) %>%
  mutate(`Country/Region` = ifelse(is.na(Country.Region.x), Country.Region.y, Country.Region.x)) %>%
  select(-Country.Region.x, -Country.Region.y) %>%
  select(`Country/Region`, alpha3) %>%
  arrange(alpha3)

readr::write_csv(full_list, "full_list.csv")
