#' @export
summary.fitsujatha <- function(object, ...) {

  ans <- object

  ans$estimate <- coef(object)
  ans$se <- sqrt(diag(vcov(object)))
  ans$z <- ans$estimate / ans$se
  ans$p.value <- 2 * (1 - pnorm(abs(ans$z)))

  ans$conf.int <- confint(object)
  ans$vcov <- vcov(object)

  class(ans) <- "summary.fitsujatha"

  ans
}
