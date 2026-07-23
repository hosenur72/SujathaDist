

#' @export

print.summary.fitsujatha <- function(x, ...) {

  cat("\n")
  cat("Summary of Fitted Sujatha Distribution\n")
  cat(rep("=", 50), sep = "")
  cat("\n\n")

  cat("Parameter Estimates\n")
  print(data.frame(
    Estimate   = x$estimate,
    Std.Error  = x$se,
    z.value    = x$z,
    p.value    = x$p.value,
    row.names = names(x$estimate)
  ))

  cat("\n95% Confidence Intervals\n")
  print(x$conf.int)

  cat("\nVariance-Covariance Matrix\n")
  print(x$vcov)

  cat("\nLog-Likelihood :", round(x$logLik, 4), "\n")
  cat("AIC            :", round(x$AIC, 4), "\n")
  cat("AICc           :", round(x$AICc, 4), "\n")
  cat("BIC            :", round(x$BIC, 4), "\n")
  cat("CAIC           :", round(x$CAIC, 4), "\n")
  cat("HQIC           :", round(x$HQIC, 4), "\n")

  invisible(x)
}
