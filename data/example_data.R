# example_data.R — Genererar exempeldata för dashboard-mallen
# Realistiska nivåer för 6 hallandskommuner, 2015–2024

library(dplyr)
library(tidyr)

set.seed(42)

kommuner <- c("Halmstad", "Varberg", "Falkenberg", "Kungsbacka", "Laholm", "Hylte")
ar <- 2015:2024

# Basbefolkning 2015 (ungefärliga verkliga värden)
bas_befolkning <- c(
  Halmstad  = 97000,
  Varberg   = 62000,
  Falkenberg = 43000,
  Kungsbacka = 80000,
  Laholm    = 25000,
  Hylte     = 10500
)

# Årlig tillväxttakt (variation mellan kommuner)
tillvaxt <- c(
  Halmstad   = 0.0085,
  Varberg    = 0.0090,
  Falkenberg = 0.0060,
  Kungsbacka = 0.0075,
  Laholm     = 0.0030,
  Hylte      = -0.0010
)

# Bygg dataframe
dashboard_data <- expand.grid(kommun = kommuner, ar = ar, stringsAsFactors = FALSE) |>
  as_tibble() |>
  mutate(
    # Befolkning med kumulativ tillväxt + slumpmässig variation
    befolkning = mapply(function(k, y) {
      bas <- bas_befolkning[k]
      t <- tillvaxt[k]
      n_ar <- y - 2015
      round(bas * (1 + t)^n_ar + rnorm(1, 0, bas * 0.002))
    }, kommun, ar),

    # Sysselsättningsgrad (78–83 % med variation)
    sysselsattning = mapply(function(k, y) {
      bas <- case_when(
        k == "Kungsbacka" ~ 82.5,
        k == "Halmstad"   ~ 80.0,
        k == "Varberg"    ~ 81.0,
        k == "Falkenberg" ~ 79.5,
        k == "Laholm"     ~ 78.5,
        k == "Hylte"      ~ 77.0,
        TRUE              ~ 79.0
      )
      trend <- (y - 2015) * 0.15
      round(bas + trend + rnorm(1, 0, 0.6), 1)
    }, kommun, ar),

    # Medelinkomst (tkr, 280–350 med tillväxt)
    medelinkomst = mapply(function(k, y) {
      bas <- case_when(
        k == "Kungsbacka" ~ 340,
        k == "Halmstad"   ~ 300,
        k == "Varberg"    ~ 310,
        k == "Falkenberg" ~ 285,
        k == "Laholm"     ~ 280,
        k == "Hylte"      ~ 270,
        TRUE              ~ 290
      )
      trend <- (y - 2015) * 4.5
      round(bas + trend + rnorm(1, 0, 3))
    }, kommun, ar),

    # Antal företag
    antal_foretag = mapply(function(k, y) {
      bas <- case_when(
        k == "Halmstad"   ~ 5800,
        k == "Kungsbacka" ~ 5200,
        k == "Varberg"    ~ 4100,
        k == "Falkenberg" ~ 2600,
        k == "Laholm"     ~ 1400,
        k == "Hylte"      ~ 650,
        TRUE              ~ 2000
      )
      trend <- (y - 2015) * round(bas * 0.012)
      round(bas + trend + rnorm(1, 0, bas * 0.01))
    }, kommun, ar)
  ) |>
  arrange(kommun, ar)
