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

## Relationship in data

# Stable isotopes
ggplot(penguins_raw2, aes(delta_13_c_o_oo, delta_15_n_o_oo, colour = species))+
  geom_point(size = 3, alpha = 0.7)+
  scale_color_viridis_d("", labels = c("Adelie", "Chinstrap", "Gentoo"))+
  labs(x = "d13C", y = "d15C")+
  theme_bw()+
  coord_equal()

ggplot(penguins_raw2, aes(species, body_mass_g, fill = species))+
  geom_violin(alpha = 0.7)+
  geom_jitter(size = 2, alpha = 0.5, shape = 21, width = 0.1)+
  scale_fill_viridis_d("", guide = 'none')+
  scale_x_discrete(labels = c("Adelie", "Chinstrap", "Gentoo"))+
  labs(x = "", y = "Body Mass (g)")+
  theme_bw()