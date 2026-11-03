# Run from the repository root: Rscript run_analysis.R
# Uses base R only. Existing generated files in outputs/ are overwritten.
for (f in c('01_relative_abundance.R', '02_diversity_indices.R',
            '03_environmental_plots.R')) source(file.path('R', f))
counts <- read.csv('data/insect_counts.csv', check.names = FALSE,
                   stringsAsFactors = FALSE, fileEncoding = 'UTF-8')
env <- read.csv('data/environment.csv', check.names = FALSE,
                stringsAsFactors = FALSE, fileEncoding = 'UTF-8')
stopifnot(all(c('Morfoespecie', 'Colecta directa', 'Colecta indirecta', 'Orden') %in% names(counts)),
          all(c('dia', 'hora', 'temperatura', 'hr') %in% names(env)),
          !anyNA(counts), !anyNA(env), !anyDuplicated(counts$Morfoespecie))
for (name in c('Colecta directa', 'Colecta indirecta')) {
  x <- counts[[name]]
  stopifnot(is.numeric(x), all(is.finite(x)), all(x >= 0), all(x == floor(x)))
}
stopifnot(all(nzchar(counts$Orden)),
          all(grepl('^([01][0-9]|2[0-3]):[0-5][0-9]$', env$hora)),
          is.numeric(env$temperatura), is.numeric(env$hr),
          all(is.finite(env$temperatura)), all(is.finite(env$hr)))
direct <- counts[['Colecta directa']]; traps <- counts[['Colecta indirecta']]
total <- direct + traps
indices <- data.frame(Method = c('Intensive search', 'Pitfall traps', 'Combined'),
                      rbind(calc(direct), calc(traps), calc(total)), row.names = NULL)
summary <- data.frame(Individuals = sum(total), Morphospecies = sum(total > 0),
                      Shared = sum(direct > 0 & traps > 0),
                      Top5_percent = 100 * sum(head(sort(total, decreasing = TRUE), 5)) / sum(total),
                      Environmental_records = nrow(env))
# Regression checks against the supplied thesis data, not a general data template.
stopifnot(sum(direct) == 3302, sum(traps) == 4997,
          summary$Morphospecies == 32, summary$Shared == 12,
          round(summary$Top5_percent, 1) == 84.6,
          round(indices$Shannon[3], 2) == 2.08,
          round(indices$Pielou[3], 2) == 0.60)
dir.create('outputs', showWarnings = FALSE)
abundance <- relative_abundance(counts)
hourly <- hourly_summary(env)
write.csv(abundance, 'outputs/relative_abundance.csv', row.names = FALSE)
write.csv(indices, 'outputs/diversity_indices.csv', row.names = FALSE)
write.csv(summary, 'outputs/summary.csv', row.names = FALSE)
write.csv(hourly$means, 'outputs/hourly_environment.csv', row.names = FALSE)
png('outputs/relative_abundance.png', width = 1200, height = 800, res = 120)
par(mar = c(5, 10, 3, 1))
barplot(rev(abundance$Relativa), names.arg = rev(abundance$Orden),
        horiz = TRUE, las = 1, col = '#247A61', border = NA,
        xlab = 'Recorded individuals (%)', main = 'Relative abundance by insect order')
dev.off()
plot_environment(hourly, 'outputs/environment.png')
writeLines(capture.output(sessionInfo()), 'outputs/sessionInfo.txt')
print(summary)
print(indices)
message('Completed: tables and plots saved in outputs/.')
