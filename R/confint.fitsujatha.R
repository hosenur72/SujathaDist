#' Confidence Intervals
#'
#' Computes Wald confidence intervals.
#'
#' @importFrom stats confint
#' @importFrom stats qnorm
#' @param object An object of class "fitsujatha".
#' @param parm Ignored.
#' @param level Confidence level.
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return Confidence interval matrix.
#'
#' @importFrom stats qnorm
#'
#' @export

confint.fitsujatha <- function(object,
                               parm = NULL,
                               level = 0.95,
                               ...) {

  alpha <- 1 - level

  z <- qnorm(1 - alpha / 2)

  est <- object$estimate

  se <- object$se

  ci <- cbind(

    Lower = est - z * se,

    Upper = est + z * se

  )

  rownames(ci) <- "theta"

  ci

}
