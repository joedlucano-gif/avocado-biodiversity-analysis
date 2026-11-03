# Selected excerpt from figura 3 tesis.R; analytical logic preserved.
# Input: numeric abundance vector, no missing or negative values.
# Requires >1 observed morphospecies and total abundance >1.
# Returns Margalef richness, Shannon diversity and Pielou evenness, in that order.

calc <- function(x) {
  x <- x[x > 0]
  N <- sum(x); S <- length(x); p <- x / N
  H <- -sum(p * log(p))
  c((S - 1) / log(N), H, H / log(S))
}
