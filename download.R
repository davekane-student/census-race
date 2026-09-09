library(tidyverse)
library(tidycensus)

# Mutually exclusive race and ethnicity variables from the 2020 Census (PL 94-171)
race_vars <- c(
  total = "P2_001N",
  hispanic = "P2_002N",
  white = "P2_005N",
  black = "P2_006N",
  aian = "P2_007N",
  asian = "P2_008N",
  nhpi = "P2_009N",
  other = "P2_010N",
  two_or_more = "P2_011N"
)

# Download tract-level race and ethnicity data for Sarasota County, FL
sarasota_race <- get_decennial(
  geography = "tract",
  variables = race_vars,
  year = 2020,
  state = "FL",
  county = "Sarasota"
)

# Save the raw data to the data directory
write_rds(sarasota_race, "data/sarasota_race.rds")
