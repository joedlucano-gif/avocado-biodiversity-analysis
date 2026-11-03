# 🌱 Avocado Biodiversity — Field Data Analysis

**Excel · R / RStudio · Agricultural research**

A biodiversity baseline built from **8,299 insects and 32 morphospecies** recorded on two Hass avocado farms in Olmos, Peru.

[Case study in Notion](https://app.notion.com/p/40c00e5930d98197b36bcf3fd769a0b2) · [Run the analysis](#run-the-analysis)

## The question

Which insects occur in avocado mulch, and how are their abundance and diversity distributed?

## My contribution

I collected field observations across **36 transects and 216 plants**, organised counts in Excel, calculated ecological indicators and created R visualisations to compare abundance and sampling methods.

## Key findings

- **Five morphospecies represented 84.6% of recorded insects.** Total abundance alone hides an uneven distribution.
- **The methods complemented each other:** 27 morphospecies from intensive searches and 17 from pitfall traps, with 12 shared and **32 in total**.

| Method | Insects recorded | Morphospecies |
| --- | --- | --- |
| Intensive search | 3,302 | 27 |
| Pitfall traps | 4,997 | 17 |

Morphospecies are groups distinguished by physical characteristics, not necessarily named species. Differences in sampling effort and capture mechanisms prevent a direct efficiency comparison.

## Value for agriculture

The study provides a local baseline for monitoring insect communities in avocado mulch and supports using complementary collection methods. It does not demonstrate improved yield, pest control or profitability.

## Explore the analysis

- [Relative abundance](R/01_relative_abundance.R) — grouped counts and percentages.
- [Diversity indices](R/02_diversity_indices.R) — reusable ecological calculations.
- [Environmental plots](R/03_environmental_plots.R) — hourly summaries and environmental plots.
- [Methods, input requirements and source](docs/methods-and-inputs.md).

## Run the analysis

Install R, download this repository and open a terminal in its root folder:

```sh
Rscript run_analysis.R
```

Or, in RStudio with the repository as the working directory:

```r
source("run_analysis.R")
```

Both input datasets are included in [data/](data/); no manual Excel export is needed. See [input mapping](docs/methods-and-inputs.md).

No additional R packages are required. The script reads the included CSV data, validates inputs and reported results, and writes four summary tables, two PNG charts and session information to `outputs/`.

The included CSV exports preserve the values and column names from the two supplied Excel sheets. The workflow adapts the selected original calculations to base R; it reproduces these summaries and plots, not every thesis figure.

## Scope

**October 2025–February 2026 · Two INAGRO farms · Olmos, Lambayeque, Peru**

Descriptive study with no mulch-free control; the findings do not establish a causal effect of mulch.

Biological Sciences thesis, Universidad Nacional de Trujillo. **Completed; defence pending.**

---

**Daniel Lucano** · [Portfolio](https://app.notion.com/p/40b00e5930d980aa8797efb988609163) · [LinkedIn](https://www.linkedin.com/in/daniel-lucano-nieves-109886270)

Validated with R 4.3.3: all result checks passed; both plots were generated and visually reviewed.
