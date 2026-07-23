#' Cumulative Distribution Function of the Sujatha Distribution
#'
#' Computes the cumulative distribution function (CDF).
#'
#' @param q Numeric vector of quantiles.
#' @param theta Positive parameter.
#'
#' @return A numeric vector of cumulative probabilities.
#'
#' @examples
#' psujatha(1, theta = 2)
#'
#' @export

psujatha <- function(q, theta){

  if(any(theta <= 0))
    stop("theta must be positive.")

  cdf <- 1 -
    exp(-theta*q) *
    (
      theta^2*q^2 +
      theta*(theta+2)*q +
      theta^2 + theta + 2
    ) /
    (theta^2 + theta + 2)

  cdf[q < 0] <- 0

  return(cdf)
}