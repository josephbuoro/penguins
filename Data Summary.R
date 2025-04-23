library(tidyverse)
library(palmerpenguins)
library(janitor)

penguins_raw2 <- clean_names(penguins_raw)

## Summarise data per species and island

penguins_raw2 |> 
  mutate(across(c(species, island), factor)) |> 
  group_by(species, island, .drop = FALSE) |> 
  count()

penguins_raw2 |> 
  group_by(species, sex) |> 
  count()

penguins_raw2 |> 
  group_by(species) |> 
  summarise(mean.mass = mean(body_mass_g, na.rm = TRUE),
            sd.mass = sd(body_mass_g, na.rm = TRUE))