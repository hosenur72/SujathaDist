#' Akaike Information Criterion
#'
#' @importFrom stats AIC
#' @param object An object of class "fitsujatha".
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return AIC value.
#'
#' @export

AIC.fitsujatha <- function(object, ...) {

  object$AIC

}
