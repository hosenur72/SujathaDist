#' Print a fitted Sujatha distribution
#'
#' @param x An object of class "fitsujatha".
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return Prints the fitted model summary.
#'
#' @export

print.fitsujatha <- function(x, ...) {

  cat("\n")
  cat("Maximum Likelihood Fit of Sujatha Distribution\n")
  cat(paste(rep("=", 60), collapse = ""), "\n\n", sep = "")

  cat("Call:\n")
  cat("fitsujatha(x)\n\n")

  cat("Sample Size :", x$n, "\n")

  if (!is.null(x$convergence)) {
    if (x$convergence == 0)
      cat("Convergence: Successful\n\n")
    else
      cat("Convergence: Failed\n\n")
  }

  cat("Parameter Estimates\n")
  cat(paste(rep("-", 60), collapse = ""), "\n")

  pval <- format.pval(x$p.value,
                      digits = 4,
                      eps = 2e-16)

  tab <- data.frame(
    Estimate  = round(x$estimate, 6),
    Std.Error = round(x$se, 6),
    Wald      = round(x$Wald, 4),
    z.value   = round(x$z, 4),
    p.value   = pval,
    check.names = FALSE
  )

  rownames(tab) <- names(x$estimate)

  print(tab)

  cat("\n95% Confidence Interval\n")
  cat(paste(rep("-", 60), collapse = ""), "\n")

  print(confint(x))

  cat("\nModel Selection Criteria\n")
  cat(paste(rep("-", 60), collapse = ""), "\n")

  cat(sprintf("%-20s %10.4f\n", "Log-Likelihood :", x$logLik))
  cat(sprintf("%-20s %10.4f\n", "AIC            :", x$AIC))
  cat(sprintf("%-20s %10.4f\n", "AICc           :", x$AICc))
  cat(sprintf("%-20s %10.4f\n", "BIC            :", x$BIC))
  cat(sprintf("%-20s %10.4f\n", "CAIC           :", x$CAIC))
  cat(sprintf("%-20s %10.4f\n", "HQIC           :", x$HQIC))

  invisible(x)
}
