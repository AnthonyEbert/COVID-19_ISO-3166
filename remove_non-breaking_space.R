

x <- read.csv("JohnsHopkins-to-A3.csv")
x$Country.Region <- gsub("\u00A0", " ", x$Country.Region, fixed = TRUE)

readr::write_csv(x, "JohnsHopkins-to-A3_no-breaking-spaces.csv")
