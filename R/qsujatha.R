#' Quantile Function of the Sujatha Distribution
#'
#' Computes quantiles of the Sujatha distribution by numerically
#' inverting the cumulative distribution function.
#' @importFrom stats runif uniroot
#'
#' @param p Numeric vector of probabilities.
#' @param theta Positive parameter.
#' @param lower.tail Logical; if TRUE (default), probabilities are P(X <= x).
#' @param log.p Logical; if TRUE, probabilities are given as log(p).
#'
#' @return A numeric vector of quantiles.
#'
#' @examples
#' qsujatha(0.5, theta = 2)
#'
#' @export

qsujatha <- function(p, theta, lower.tail = TRUE, log.p = FALSE){

  if(any(theta <= 0))
    stop("theta must be positive.")

  if(log.p)
    p <- exp(p)

  if(!lower.tail)
    p <- 1 - p

  if(any(p < 0 | p > 1))
    stop("Probabilities must be between 0 and 1.")

  q <- numeric(length(p))

  q[p == 0] <- 0
  q[p == 1] <- Inf

  ind <- which(p > 0 & p < 1)

  for(i in ind){

    q[i] <- uniroot(
      function(x) psujatha(x, theta) - p[i],
      lower = 0,
      upper = 100,
      tol = 1e-10
    )$root

  }

  return(q)
}
