# Methods and reproducibility

## Data

The datasets are currently local and are not published in this repository. To run locally, export each sheet below as UTF-8 CSV under the listed path, keeping the original headers and values. Create the `data/` folder first.

| Required local file | Supplied workbook / sheet | Rows |
| --- | --- | --- |
| data/insect_counts.csv | Datos_colecta_directa_indirecta_R(1).xlsx / Datos_R | 32 |
| data/environment.csv | temp_hr_tidy.xlsx / datos | 216 |

CSV exports preserve all sheet values and column names; Excel formatting is not carried over. The workbooks remain the source files. No names, contact details or precise farm coordinates appear in these two sheets.

Insect columns: `Morfoespecie`, `Colecta directa`, `Colecta indirecta`, `Orden`. Counts are aggregated across the study, not individual transect observations.

Environmental columns: `dia`, `hora`, `temperatura`, `hr`. The file has numbered days rather than calendar dates. Time is HH:MM. Units are not encoded in the headers; plots retain neutral source-unit labels. Hourly means pool observations across days, as in the original script; they are descriptive rather than independent replicate comparisons.

## Execution

From the repository root, run `Rscript run_analysis.R`. Base R only; no package installation or internet access is needed during analysis.

The runner imports data, validates required columns, missing values, integer nonnegative counts, unique morphospecies and time formats, then calls three modules:

- `R/01_relative_abundance.R`: combine methods and aggregate abundance by insect order.
- `R/02_diversity_indices.R`: Margalef, Shannon (natural logarithms) and Pielou for each method and combined counts.
- `R/03_environmental_plots.R`: hourly means and plots of observations plus means.

The diversity function excludes zero counts and requires N > 1 and S > 1. Regression checks assert the supplied thesis totals and rounded diversity results. These checks intentionally flag a different dataset rather than silently accept changed headline metrics.

Outputs are regenerated in `outputs/`: relative_abundance.csv, diversity_indices.csv, summary.csv, hourly_environment.csv, relative_abundance.png, environment.png and sessionInfo.txt. Existing generated files are overwritten.

## Verified data results

| Result | Recomputed |
| --- | --- |
| Intensive search / pitfall traps | 3,302 / 4,997 insects |
| Combined abundance / richness | 8,299 / 32 morphospecies |
| Shared morphospecies | 12 |
| Five most abundant morphospecies | 84.5765% |
| Combined Shannon / Pielou | 2.0820 / 0.6007 |

The calculation logic comes from the author's `figura 1 tesis.R`, `figura 3 tesis.R` and `tesis f5.R`. This repository version adds data loading, validation and exports, and uses base R instead of dplyr/ggplot2 for portability. Plot styling differs from the thesis. This is a reproducible subset of the analysis, not a reproduction of every figure.

## Study and limits

Two INAGRO Hass avocado farms in Olmos, Lambayeque, Peru; October 2025–February 2026; 36 transects and 216 plants. Morphospecies are groups distinguished by physical characteristics, not necessarily named species.

Capture methods and effort differ, preventing a direct efficiency comparison. There was no mulch-free control. The study does not establish causal effects of mulch or improvements in yield, pest suppression or profitability.

## Source

Daniel Lucano's completed 2026 thesis, *Entomofauna asociada al mulch en Persea americana Mill. cultivar Hass, Olmos, Lambayeque, Perú*, Universidad Nacional de Trujillo. Table 1 and Figures 1–5; defence pending. Taxonomic identifications were corroborated by the Klaus Raven Büller Entomology Museum at Universidad Nacional Agraria La Molina.

[Notion case study](https://app.notion.com/p/40c00e5930d98197b36bcf3fd769a0b2) · [Project summary](../README.md)

Execution verified with R 4.3.3 on Linux. Input exports were checked cell by cell against the supplied Excel sheets; independent Python calculations agreed with the R metrics. Both generated PNGs were visually reviewed.
