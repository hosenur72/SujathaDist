#' Variance-Covariance Matrix
#'
#' @importFrom stats vcov
#' @param object An object of class "fitsujatha".
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return Variance-covariance matrix.
#'
#' @export

vcov.fitsujatha <- function(object, ...) {

  object$vcov

}
