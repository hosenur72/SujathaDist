#' Coefficients of a fitted Sujatha distribution
#'
#' @importFrom stats coef
#' @param object An object of class "fitsujatha".
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return Estimated parameter(s).
#'
#' @export

coef.fitsujatha <- function(object, ...) {

  object$estimate

}
