# Adapted from tesis f5.R. Same hourly pooling; base R graphics.
hourly_summary <- function(d) {
  d$h <- as.numeric(substr(d$hora, 1, 2)) +
    as.numeric(substr(d$hora, 4, 5)) / 60
  d$bloque <- floor(d$h)
  means <- aggregate(d[c('h', 'temperatura', 'hr')],
                     list(bloque = d$bloque), mean)
  list(observations = d, means = means)
}
plot_environment <- function(result, file) {
  png(file, width = 1400, height = 650, res = 120)
  on.exit(dev.off())
  par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
  for (y in c('temperatura', 'hr')) {
    label <- if (y == 'temperatura') 'Temperature (source units)' else 'Relative humidity (source units)'
    plot(result$observations$h, result$observations[[y]], pch = 16,
         col = adjustcolor('#247A61', alpha.f = 0.3),
         xlab = 'Hour of day', ylab = label, xlim = c(7, 18))
    lines(result$means$h, result$means[[y]], col = '#1E4D78', lwd = 2)
  }
}
