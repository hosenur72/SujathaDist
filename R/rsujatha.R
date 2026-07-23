#' Random Generation from the Sujatha Distribution
#'
#' Generates random observations from the Sujatha distribution using one of
#' three methods:
#' \itemize{
#'   \item{\code{"mixture"}}{Exact Gamma-mixture method (default).}
#'   \item{\code{"inverse"}}{Inverse transform method.}
#'   \item{\code{"rejection"}}{Acceptance-rejection method using an exponential proposal.}
#' }
#'
#' @param n Number of observations.
#' @param theta Positive parameter of the Sujatha distribution.
#' @param method Generation method. One of
#'   \code{"mixture"}, \code{"inverse"}, or \code{"rejection"}.
#' @param lambda Rate parameter of the exponential proposal.
#'   Used only for the rejection method.
#' @param M Rejection constant. If NULL, it is computed automatically.
#'
#' @return A numeric vector of random observations.
#'
#' @importFrom stats runif rexp rgamma dexp optimize
#'
#' @export
#'
#' @examples
#' set.seed(123)
#'
#' ## Gamma-mixture method (default)
#' x1 <- rsujatha(10, theta = 2)
#'
#' ## Inverse transform
#' x2 <- rsujatha(10, theta = 2, method = "inverse")
#'
#' ## Acceptance-Rejection
#' x3 <- rsujatha(10,
#'                theta = 2,
#'                method = "rejection",
#'                lambda = 1)
rsujatha <- function(
    n,
    theta,
    method = c("mixture", "inverse", "rejection"),
    lambda = NULL,
    M = NULL
) {
  method <- match.arg(method)

  ##------------------------------------------------------------
  ## Input validation
  ##------------------------------------------------------------

  if(length(n) != 1 || !is.numeric(n) || n <= 0)
    stop("'n' must be a positive integer.")

  n <- as.integer(n)

  if(length(theta) != 1 || !is.numeric(theta) || theta <= 0)
    stop("'theta' must be positive.")

  ##============================================================
  ## Method 1 : Exact Gamma Mixture
  ##============================================================

  if(method == "mixture"){

    w1 <- theta^2/(theta^2 + theta + 2)
    w2 <- theta/(theta^2 + theta + 2)
    w3 <- 2/(theta^2 + theta + 2)

    component <- sample(1:3,
                        size = n,
                        replace = TRUE,
                        prob = c(w1, w2, w3))

    x <- numeric(n)

    if(any(component == 1))
      x[component == 1] <-
      rgamma(sum(component == 1),
             shape = 1,
             rate = theta)

    if(any(component == 2))
      x[component == 2] <-
      rgamma(sum(component == 2),
             shape = 2,
             rate = theta)

    if(any(component == 3))
      x[component == 3] <-
      rgamma(sum(component == 3),
             shape = 3,
             rate = theta)

    return(x)

  }

  ##============================================================
  ## Method 2 : Inverse Transform
  ##============================================================

  if(method == "inverse"){

    u <- runif(n)

    return(qsujatha(u, theta))

  }

  ##============================================================
  ## Method 3 : Acceptance-Rejection
  ##============================================================

  if(is.null(lambda))
    lambda <- theta/2

  if(lambda <= 0 || lambda >= theta)
    stop("'lambda' must satisfy 0 < lambda < theta.")

  if(is.null(M)){

    ratio <- function(x){

      dsujatha(x, theta)/
        dexp(x, rate = lambda)

    }

    opt <- optimize(ratio,
                    interval = c(0,20),
                    maximum = TRUE)

    M <- opt$objective

  }

  x <- numeric(n)

  i <- 1

  while(i <= n){

    y <- rexp(1, rate = lambda)

    u <- runif(1)

    if(u <= dsujatha(y, theta)/
       (M*dexp(y, rate = lambda))){

      x[i] <- y

      i <- i + 1

    }

  }

  return(x)

}
