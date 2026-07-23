#' Goodness-of-Fit Measures for the Sujatha Distribution
#'
#' Computes several goodness-of-fit statistics for a fitted
#' Sujatha distribution.
#'
#' @param object An object of class \code{"fitsujatha"}.
#'
#' @return
#' A list containing
#' \itemize{
#' \item Log-likelihood
#' \item AIC
#' \item AICc
#' \item BIC
#' \item CAIC
#' \item HQIC
#' \item KS statistic
#' \item KS p-value
#' \item Anderson-Darling statistic
#' \item AD p-value
#' \item Cramer-von Mises statistic
#' \item CVM p-value
#' \item Watson statistic
#' \item Watson p-value
#' }
#'
#' @importFrom stats ks.test
#'
#' @export

gofsujatha <- function(object){

  if(!inherits(object,"fitsujatha"))
    stop("object must be of class 'fitsujatha'.")

  x <- object$data

  theta <- object$estimate

  n <- length(x)

  ###############################################################
  ## Kolmogorov-Smirnov
  ###############################################################

  ks <- ks.test(

    x,

    function(z)
      psujatha(z,theta)

  )

  ###############################################################
  ## Ordered observations
  ###############################################################

  y <- sort(x)

  F0 <- psujatha(y,theta)

  ###############################################################
  ## Anderson-Darling
  ###############################################################

  AD <-

    -n-

    mean(

      (2*(1:n)-1)*

        (log(F0)+log(1-rev(F0)))

    )

  ###############################################################
  ## Cramer-von Mises
  ###############################################################

  CVM <-

    1/(12*n)+

    sum(

      (F0-

         (2*(1:n)-1)/(2*n)

      )^2

    )

  ###############################################################
  ## Watson
  ###############################################################

  Watson <-

    CVM-

    n*

    (mean(F0)-0.5)^2
  ###############################################################
  ## AD, CVM and Watson with bootstrap p-values
  ###############################################################

  pv <- ad_cvm_watson_pvalue(
    x = x,
    theta = theta,
    B = 1000
  )

  AD <- pv$AD
  AD.pvalue <- pv$AD.pvalue

  CVM <- pv$CVM
  CVM.pvalue <- pv$CVM.pvalue

  Watson <- pv$Watson
  Watson.pvalue <- pv$Watson.pvalue


  ###############################################################
  ## Output
  ###############################################################

  out <- list(

    LogLik = object$logLik,

    AIC = object$AIC,

    AICc = object$AICc,

    BIC = object$BIC,

    CAIC = object$CAIC,

    HQIC = object$HQIC,

    KS = as.numeric(ks$statistic),

    KS.pvalue = ks$p.value,

    AD = AD,
    AD.pvalue = AD.pvalue,

    CVM = CVM,
    CVM.pvalue = CVM.pvalue,

    Watson = Watson,
    Watson.pvalue = Watson.pvalue
)


  class(out) <- "gofsujatha"

  out

}
