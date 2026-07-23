#' Log-likelihood
#'
#' @param object An object of class "fitsujatha".
#' @param ... Additional arguments passed to or from other methods.
#'
#' @importFrom stats logLik
#' @return Object of class "logLik".
#'
#' @export

logLik.fitsujatha <- function(object, ...) {

  val <- object$logLik

  attr(val, "df") <- 1

  attr(val, "nobs") <- object$n

  class(val) <- "logLik"

  val

}
