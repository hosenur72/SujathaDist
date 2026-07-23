#' Diagnostic Plots for Sujatha Distribution
#'
#' Produces diagnostic plots for an object of class
#' \code{"fitsujatha"}.
#' @importFrom graphics hist
#' @importFrom graphics curve
#' @importFrom graphics legend
#' @importFrom graphics abline
#' @importFrom stats ecdf
#' @importFrom stats ppoints
#' @param x An object of class \code{"fitsujatha"}.
#' @param which Integer specifying the plot to draw.
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return A diagnostic plot.
#'
#' @export

plot.fitsujatha <- function(x,
                            which = 1,
                            ...){

  if(!inherits(x,"fitsujatha"))
    stop("x must be of class 'fitsujatha'.")

  theta <- x$estimate

  data <- x$data

  n <- length(data)

  switch(which,

         ###############################################################
         ## 1 Histogram + fitted density
         ###############################################################

         {

           hist(data,
                probability = TRUE,
                col = "lightgray",
                border = "white",
                main = "Histogram with Fitted Density",
                xlab = "x")

           curve(dsujatha(x,
                          theta),
                 add = TRUE,
                 lwd = 2,
                 col = "red")

         },

         ###############################################################
         ## 2 Empirical CDF vs fitted CDF
         ###############################################################

         {

           plot(ecdf(data),
                verticals = TRUE,
                do.points = FALSE,
                main = "Empirical vs Fitted CDF",
                xlab = "x",
                ylab = "CDF")

           curve(psujatha(x,
                          theta),
                 add = TRUE,
                 col = "blue",
                 lwd = 2)

           legend("bottomright",
                  c("Empirical","Fitted"),
                  lwd = 2,
                  col = c("black","blue"))

         },

         ###############################################################
         ## 3 QQ Plot
         ###############################################################

         {

           p <- ppoints(n)

           theo <- qsujatha(p,
                            theta)

           samp <- sort(data)

           plot(theo,
                samp,
                pch = 19,
                col = "blue",
                main = "Q-Q Plot",
                xlab = "Theoretical Quantiles",
                ylab = "Sample Quantiles")

           abline(0,
                  1,
                  col = "red",
                  lwd = 2)

         },

         ###############################################################
         ## 4 PP Plot
         ###############################################################

         {

           emp <- (1:n-0.5)/n

           fit <- psujatha(sort(data),
                           theta)

           plot(emp,
                fit,
                pch = 19,
                col = "blue",
                main = "P-P Plot",
                xlab = "Empirical Probability",
                ylab = "Fitted Probability")

           abline(0,
                  1,
                  col = "red",
                  lwd = 2)

         },

         ###############################################################
         ## 5 Survival Plot
         ###############################################################

         {

           plot(sort(data),
                1-(1:n)/n,
                type = "s",
                lwd = 2,
                main = "Empirical Survival Function",
                xlab = "x",
                ylab = "Survival")

           curve(1-psujatha(x,
                            theta),
                 add = TRUE,
                 col = "red",
                 lwd = 2)

         }

  )

}


#plot(fit, which = "hist")
#plot(fit, which = "cdf")
#plot(fit, which = "qq")
#plot(fit, which = "pp")
#plot(fit, which = "survival")
