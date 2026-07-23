#' @export

print.gofsujatha <- function(x,...){

  cat("\n")

  cat("Goodness-of-Fit Statistics\n")

  cat("------------------------------------------\n")

  cat(sprintf("%-18s %12.6f\n","LogLik",x$LogLik))

  cat(sprintf("%-18s %12.6f\n","AIC",x$AIC))

  cat(sprintf("%-18s %12.6f\n","AICc",x$AICc))

  cat(sprintf("%-18s %12.6f\n","BIC",x$BIC))

  cat(sprintf("%-18s %12.6f\n","CAIC",x$CAIC))

  cat(sprintf("%-18s %12.6f\n","HQIC",x$HQIC))

  cat(sprintf("%-18s %12.6f\n","KS",x$KS))

  cat(sprintf("%-18s %12.6f\n","KS p-value",x$KS.pvalue))

  cat(sprintf("%-18s %12.6f\n","AD",x$AD))
  cat(sprintf("%-18s %12.6f\n","AD p-value",x$AD.pvalue))

  cat(sprintf("%-18s %12.6f\n","CVM",x$CVM))
  cat(sprintf("%-18s %12.6f\n","CVM p-value",x$CVM.pvalue))

  cat(sprintf("%-18s %12.6f\n","Watson",x$Watson))
  cat(sprintf("%-18s %12.6f\n","Watson p-value",x$Watson.pvalue))
  cat("\n")

}
