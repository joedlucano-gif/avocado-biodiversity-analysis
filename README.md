# 🌱 Avocado Biodiversity — Field Data Analysis

**Excel · R / RStudio · Agricultural research**

A biodiversity baseline built from **8,299 insects and 32 morphospecies** recorded on two Hass avocado farms in Olmos, Peru.

[Case study in Notion](https://app.notion.com/p/40c00e5930d98197b36bcf3fd769a0b2) · [Selected R code](R/)

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
- [Environmental plots](R/03_environmental_plots.R) — hourly summaries and ggplot visualisation.
- [Methods, input requirements and source](docs/methods-and-inputs.md).

These are selected excerpts from the original scripts, not a complete reproducible pipeline. The input Excel workbooks are not included; the code was not rerun during publication.

## Scope

**October 2025–February 2026 · Two INAGRO farms · Olmos, Lambayeque, Peru**

Descriptive study with no mulch-free control; the findings do not establish a causal effect of mulch.

Biological Sciences thesis, Universidad Nacional de Trujillo. **Completed; defence pending.**

---

**Daniel Lucano** · [Portfolio](https://app.notion.com/p/40b00e5930d980aa8797efb988609163) · [LinkedIn](https://www.linkedin.com/in/daniel-lucano-nieves-109886270)
