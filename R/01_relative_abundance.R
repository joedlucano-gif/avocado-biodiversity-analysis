# Selected excerpt from figura 1 tesis.R; analytical logic preserved.
# Requires dplyr and an imported datos table with Orden,
# Colecta directa and Colecta indirecta columns.
# See docs/methods-and-inputs.md before running.
library(dplyr)

orden_ab <- datos %>%
  mutate(Total = `Colecta directa` + `Colecta indirecta`) %>%
  group_by(Orden) %>%
  summarise(Abundancia = sum(Total), .groups = "drop") %>%
  mutate(Relativa = Abundancia / sum(Abundancia) * 100) %>%
  arrange(desc(Relativa)) %>%
  mutate(Orden = factor(Orden, levels = Orden))
