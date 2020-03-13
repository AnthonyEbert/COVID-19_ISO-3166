
library(dplyr)

x <- read.csv("JohnsHopkins-to-A3.csv")$Country.Region %>%
  as.character()
y <- gsub("\u00A0", " ", x, fixed = TRUE)

all.equal(x, y)
stopifnot(all.equal(x, y))