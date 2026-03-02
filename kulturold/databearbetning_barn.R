## Barn total

data <- read_excel("grunddata_barn.xlsx") |>
  pivot_longer(2:8, names_to="Kommun", values_to="Värde") |>
  mutate(Värde = replace_na(Värde, 0)) |>
  filter(Värde != 0) |>
  writexl::write_xlsx("barn_total.xlsx")

# Vuxna 
kod_nyckel <- tibble("Kommun" = c("Halland", "Laholm", "Hylte", "Halmstad", "Falkenberg", "Varberg", "Kungsbacka"),
                        "kod" = c("13", "1381", "1315", "1380", "1382", "1383", "1384"))

data <- read_excel("grunddata_vuxna.xlsx") |>
  pivot_longer(3:9, names_to="Kommun", values_to="Värde") |>
  mutate(Värde = replace_na(Värde, 0)) |>
  filter(Värde != 0) |>
  rename("Kulturområde" =2) |>
  mutate(år = as.character(år)) |>
  group_by(Kulturområde, 
           år, Kommun) |>
  summarize(Värde = sum(Värde)) |>
  rename("År" = "år") |>
  writexl::write_xlsx("vuxna_total.xlsx")

data <- read_excel("grunddata_vuxna.xlsx") |>
  pivot_longer(3:9, names_to="Kommun", values_to="Värde") |>
  mutate(Värde = replace_na(Värde, 0)) |>
  filter(Värde != 0) |>
  rename("Kulturområde" =2) |>
  mutate(år = as.character(år)) |>
  group_by(år, Kommun) |>
  summarize(Värde = sum(Värde), .groups="drop") |>
  left_join(kod_nyckel) |>
  left_join(func_hämta_befolkning()) |>
  mutate(`Antal per 100 invånare` = Värde/Folkmängd*100) |>
  select(år, Kommun, "Antal" = Värde, `Antal per 100 invånare`) |>
  pivot_longer(3:4, names_to="Variabel", values_to="Värde") |>
  rename("År" = "år") |>
  writexl::write_xlsx("vuxna_kommun.xlsx")
