library(tidyverse)
library(tidycensus)

# 2000 Decennial Census (SF1)
d_2000 <- get_decennial(
  geography = "tract",
  variables = c(
    total = "P004001",
    hispanic = "P004002",
    white = "P004005",
    black = "P004006",
    asian = "P004008"
  ),
  year = 2000,
  state = "FL",
  county = "Sarasota",
  geometry = TRUE,
  output = "wide"
) |>
  mutate(year = 2000)

# 2010 Decennial Census (PL 94-171)
d_2010 <- get_decennial(
  geography = "tract",
  variables = c(
    total = "P002001",
    hispanic = "P002002",
    white = "P002005",
    black = "P002006",
    asian = "P002008"
  ),
  year = 2010,
  sumfile = "pl",
  state = "FL",
  county = "Sarasota",
  geometry = TRUE,
  output = "wide"
) |>
  mutate(year = 2010)

# 2020 Decennial Census (PL 94-171)
d_2020 <- get_decennial(
  geography = "tract",
  variables = c(
    total = "P2_001N",
    hispanic = "P2_002N",
    white = "P2_005N",
    black = "P2_006N",
    asian = "P2_008N"
  ),
  year = 2020,
  state = "FL",
  county = "Sarasota",
  geometry = TRUE,
  output = "wide"
) |>
  mutate(year = 2020)

# Combine all three decennial censuses
sarasota_race <- bind_rows(d_2000, d_2010, d_2020)

# Save the combined historical dataset
write_rds(sarasota_race, "data/sarasota_race.rds")
