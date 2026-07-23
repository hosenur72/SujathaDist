#' Deviance
#'
#' @importFrom stats deviance
#' @param object An object of class "fitsujatha".
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return Model deviance.
#'
#' @export

deviance.fitsujatha <- function(object, ...) {

  object$Deviance

}
