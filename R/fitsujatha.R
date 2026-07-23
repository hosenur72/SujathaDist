#' Maximum Likelihood Estimation for the Sujatha Distribution
#'
#' Fits the Sujatha distribution using Maximum Likelihood Estimation (MLE).
#'
#' @param x A numeric vector of observations.
#' @param start Initial value of theta.
#' @param method Optimization method (default = "L-BFGS-B").
#' @importFrom stats pnorm
#' @return
#' An object of class \code{"fitsujatha"} containing
#' \itemize{
#'   \item Estimate
#'   \item Standard error
#'   \item Variance-covariance matrix
#'   \item Hessian matrix
#'   \item Log-likelihood
#'   \item AIC
#'   \item AICc
#'   \item BIC
#'   \item CAIC
#'   \item HQIC
#'   \item Deviance
#'   \item Convergence status
#'   \item Number of iterations
#'   \item Original data
#' }
#'
#' @importFrom stats optim qnorm pnorm
#'
#' @export
#'
#' @examples
#' set.seed(123)
#' x <- rsujatha(100, theta = 2)
#' fit <- fitsujatha(x)
#' fit
#'
fitsujatha <- function(x,
                       start = 1,
                       method = "L-BFGS-B"){

  if(!is.numeric(x))
    stop("x must be numeric.")

  if(any(x < 0))
    stop("Data must be non-negative.")

  n <- length(x)

  ##############################################################
  ## Negative Log-Likelihood
  ##############################################################

  nll <- function(theta){

    if(theta <= 0)
      return(Inf)

    -sum(log(dsujatha(x, theta)))
  }

  ##############################################################
  ## Optimization
  ##############################################################

  fit <- optim(

    par = start,

    fn = nll,

    method = method,

    lower = 1e-8,

    hessian = TRUE

  )

  ##############################################################
  ## Estimates
  ##############################################################

  theta_hat <- fit$par

  logLik <- -fit$value

  ##############################################################
  ## Hessian
  ##############################################################

  H <- fit$hessian

  ##############################################################
  ## Variance-Covariance
  ##############################################################

  VCOV <- tryCatch(

    solve(H),

    error = function(e)
      matrix(NA,1,1)

  )

  ##############################################################
  ## Standard Error
  ##############################################################

  SE <- sqrt(diag(VCOV))

  ##############################################################
  ## Wald Statistic
  ##############################################################

  z <- theta_hat/SE

  ##############################################################
  ## p-value
  ##############################################################

  p.value <-

    2*(1-pnorm(abs(z)))

  ##############################################################
  ## Confidence Interval
  ##############################################################

  lower <- theta_hat-

    qnorm(.975)*SE

  upper <- theta_hat+

    qnorm(.975)*SE

  CI <- cbind(lower,upper)

  rownames(CI) <- "theta"

  ##############################################################
  ## Information Criteria
  ##############################################################

  k <- 1

  AIC <- -2*logLik+2*k

  AICc <-

    AIC+

    2*k*(k+1)/(n-k-1)

  BIC <-

    -2*logLik+

    log(n)*k

  CAIC <-

    -2*logLik+

    k*(log(n)+1)

  HQIC <-

    -2*logLik+

    2*k*log(log(n))

  ##############################################################
  ## Deviance
  ##############################################################

  Deviance <- -2*logLik

  ##############################################################
  ## Output
  ##############################################################

  out <- list(

    estimate = theta_hat,

    se = SE,

    vcov = VCOV,

    Hessian = H,

    logLik = logLik,

    NegLogLik = -logLik,

    Deviance = Deviance,

    AIC = AIC,

    AICc = AICc,

    BIC = BIC,

    CAIC = CAIC,

    HQIC = HQIC,

    Wald = z^2,

    z = z,

    p.value = p.value,

    conf.int = CI,

    convergence = fit$convergence,

    message = fit$message,

    counts = fit$counts,

    n = n,

    data = x

  )

  class(out) <- "fitsujatha"

  out

}
