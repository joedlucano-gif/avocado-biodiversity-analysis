# Adapted from figura 3 tesis.R. Natural logarithms; positive counts only.
calc <- function(x) {
  stopifnot(is.numeric(x), all(is.finite(x)), all(x >= 0))
  x <- x[x > 0]
  N <- sum(x); S <- length(x)
  if (N <= 1 || S <= 1) stop('Diversity indices require N > 1 and S > 1.')
  p <- x / N
  H <- -sum(p * log(p))
  c(Individuals = N, Richness = S, Margalef = (S - 1) / log(N),
    Shannon = H, Pielou = H / log(S))
}
