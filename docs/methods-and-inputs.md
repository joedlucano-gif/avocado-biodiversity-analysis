# Methods and inputs

## Study design

Descriptive field study on two INAGRO Hass avocado farms in Olmos, Lambayeque, Peru, from October 2025 to February 2026. Sampling covered **36 transects and 216 plants**, using intensive searches and pitfall traps.

Counts were organised in Excel by morphospecies and collection method. R was used for abundance summaries, ecological indicators and visualisation. A morphospecies is distinguished by physical characteristics and is not necessarily identified to a named species.

## Selected code

| File | Demonstrates | Required input |
| --- | --- | --- |
| [Relative abundance](../R/01_relative_abundance.R) | Grouped aggregation and percentage calculation | Imported `datos` table: `Orden`, `Colecta directa`, `Colecta indirecta` |
| [Diversity indices](../R/02_diversity_indices.R) | Reusable function for Margalef, Shannon and Pielou | Numeric vector of counts per morphospecies |
| [Environmental plots](../R/03_environmental_plots.R) | Time transformation, hourly means and reusable ggplot function | `temp_hr_tidy.xlsx`: `hora`, `temperatura`, `hr` |

These are independent excerpts, not a sequential pipeline. Sources are the author's scripts `figura 1 tesis.R`, `figura 3 tesis.R` and `tesis f5.R`. Analytical expressions are preserved; explanatory comments and an explicit dplyr import were added.

## Running and interpreting

Use R; RStudio is optional. Install the referenced packages before running: dplyr for abundance, base R for diversity, and tidyverse, patchwork and readxl for the environmental excerpt.

- Import the collection workbook into `datos` with the exact columns listed above. The original scripts reference `Datos_colecta_directa_indirecta_R.xlsx`.
- Use valid nonnegative numeric counts without missing values. The diversity function removes zero counts and requires more than one observed morphospecies and total abundance greater than one. It returns three unnamed values in this order: Margalef, Shannon, Pielou.
- Environmental time values must be text in HH:MM format. Numeric temperature and humidity values must be checked for missing data before computing means. Place the environmental workbook in the working directory.
- The environmental excerpt defines `fig(y, col, lab)`; it does not call the function or save an image. Its display range is 07:00–18:00.

The input workbooks are not included. The excerpts were reviewed for documentation, not rerun against those workbooks. Reported findings come from the thesis, not from a fresh execution of this repository.

## Findings and limits

Intensive search recorded 3,302 insects and 27 morphospecies; pitfall traps recorded 4,997 insects and 17 morphospecies. With 12 morphospecies shared, the combined inventory contains **32 morphospecies and 8,299 insects**. Overall Shannon diversity was **2.08** and Pielou evenness **0.60**.

Different capture mechanisms and effort prevent a direct efficiency comparison. Two farms, five months and no mulch-free control limit generalisation and causal conclusions. No yield, profitability or pest-suppression improvement was measured.

## Source

Daniel Lucano's completed 2026 thesis, *Entomofauna asociada al mulch en Persea americana Mill. cultivar Hass, Olmos, Lambayeque, Perú*, Universidad Nacional de Trujillo. Results: Table 1 and Figures 1–5. Defence pending.

Taxonomic identifications were corroborated by the Klaus Raven Büller Entomology Museum at Universidad Nacional Agraria La Molina.

[Notion case study](https://app.notion.com/p/40c00e5930d98197b36bcf3fd769a0b2) · [Project summary](../README.md)
