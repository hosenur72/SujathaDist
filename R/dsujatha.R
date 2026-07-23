#' Density Function of the Sujatha Distribution
#'
#' Computes the probability density function (PDF) of the
#' Sujatha distribution.
#'
#' @importFrom stats integrate
#' @param x A numeric vector of observations.
#' @param theta A positive parameter.
#'
#' @return A numeric vector of density values.
#'
#' @examples
#' dsujatha(1, theta = 2)
#' dsujatha(c(0.5, 1, 2), theta = 3)
#'
#' @export

dsujatha <- function(x, theta){

  if(any(theta <= 0))
    stop("theta must be positive.")

  f <- theta^3 * (1 + x + x^2) *
    exp(-theta * x) /
    (theta^2 + theta + 2)

  f[x < 0] <- 0

  return(f)
}
