#' Bayesian Information Criterion
#'
#' Returns the Bayesian Information Criterion (BIC).
#'
#' @param object An object of class `"fitsujatha"`.
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return A numeric value giving the BIC.
#'
#' @importFrom stats BIC
#' @export

BIC.fitsujatha <- function(object, ...) {
  object$BIC
}
