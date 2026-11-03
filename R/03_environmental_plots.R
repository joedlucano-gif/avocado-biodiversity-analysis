# Selected excerpt from tesis f5.R; analytical logic preserved.
# Requires temp_hr_tidy.xlsx (not included). Defines fig(); does not export a chart.
# See docs/methods-and-inputs.md for column and time requirements.

library(tidyverse); library(patchwork); library(readxl)
d <- read_excel("temp_hr_tidy.xlsx") |>
  mutate(h = as.numeric(substr(hora,1,2)) + as.numeric(substr(hora,4,5))/60,
         bloque = floor(h))

medias <- d |> group_by(bloque) |>
  summarise(h = mean(h), temperatura = mean(temperatura), hr = mean(hr))

fig <- function(y, col, lab) {
  ggplot(d, aes(h, .data[[y]])) +
    geom_point(alpha = .25, size = 1.4, colour = col) +
    geom_line(data = medias, colour = col, linewidth = 1.1) +
    scale_x_continuous(breaks = 7:18, limits = c(7, 18)) +
    labs(x = NULL, y = lab) +
    theme_classic(base_size = 11)
}
