# Adapted from figura 1 tesis.R. Same aggregation, using base R.
relative_abundance <- function(datos) {
  totals <- datos[['Colecta directa']] + datos[['Colecta indirecta']]
  result <- aggregate(totals, list(Orden = datos$Orden), sum)
  names(result)[2] <- 'Abundancia'
  result$Relativa <- 100 * result$Abundancia / sum(result$Abundancia)
  result[order(result$Relativa, decreasing = TRUE), ]
}
