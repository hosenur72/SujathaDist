getwd()
devtools::document()
devtools::install()
library(SujathaDist)
dsujatha(1, theta = 2)
#codeing of cdf and save
devtools::document()
devtools::install()
library(SujathaDist)

psujatha(1, theta = 2)

psujatha(c(0,1,2,3), theta = 2)


#quantile function of SD (type and save)
remove.packages("SujathaDist")
unlink(
  "C:/Users/hosen/AppData/Local/R/win-library/4.2/SujathaDist",
  recursive = TRUE,
  force = TRUE
)
dir.exists("C:/Users/hosen/AppData/Local/R/win-library/4.2/SujathaDist")

dir.exists("C:/Users/hosen/AppData/Local/R/win-library/4.2/SujathaDist")
"package:SujathaDist" %in% search()
list.files(".", recursive = TRUE)
file.remove("dsujatha.R")
readLines("NAMESPACE")
setwd("C:/Users/hosen/OneDrive/Documents/SujathaDist")

source("R/dsujatha.R")
source("R/psujatha.R")
source("R/qsujatha.R")
qsujatha(0.5, theta = 2)

setwd("C:/Users/hosen/OneDrive/Documents/SujathaDist")

unlink("man", recursive = TRUE)
file.remove("NAMESPACE")

devtools::document()
devtools::install(force = TRUE)

library(SujathaDist)

qsujatha(0.5, theta = 2)

#Random number generATION
devtools::document()
devtools::install()
set.seed(123)

rsujatha(10, theta = 2)
remove.packages("SujathaDist")
dir.exists("C:/Users/hosen/AppData/Local/R/win-library/4.2/SujathaDist")
traceback()
devtools::load_all()
source("R/dsujatha.R")
source("R/psujatha.R")
source("R/qsujatha.R")
source("R/rsujatha.R")

set.seed(123)
rsujatha(10, theta = 2)

rsujatha(10, theta = 2,METHOD="rejection")
utils::packageVersion("SujathaDist")
devtools::document()
devtools::install()
library(SujathaDist)
packageVersion("SujathaDist")

getwd()
list.files()

devtools::document()
devtools::install()
remotes::install_local()
library(SujathaDist)
remove.packages("SujathaDist")
unlink(
  "C:/Users/hosen/AppData/Local/R/win-library/4.2/SujathaDist",
  recursive = TRUE,
  force = TRUE
)

devtools::document()
devtools::install(force = TRUE)
library(SujathaDist)
packageVersion("SujathaDist")
ls("package:SujathaDist")

list.files("R")
readLines("R/rsujatha.R", n = 20)
grep("@export", readLines("R/rsujatha.R"), value = TRUE)
#' @export
devtools::document()
readLines("NAMESPACE")
devtools::install(force = TRUE)
library(SujathaDist)


set.seed(123)

## 1. Inverse Transform
x1 <- rsujatha(1000,
               theta = 2,
               method = "inverse")

## 2. Exact Gamma Mixture (Recommended)
x2 <- rsujatha(1000,
               theta = 2,
               method = "mixture")

## 3. Acceptance-Rejection
x3 <- rsujatha(1000,
               theta = 2,
               method = "rejection",
               lambda = 1.5)

summary(x1)
summary(x2)
summary(x3)
curve(
  dsujatha(x, theta = 2) /
    (0.5 * dgamma(x, shape = 2, rate = 0.5)),
  from = 0,
  to = 10,
  ylab = "Acceptance ratio"
)

abline(h = 1, col = "red")
ratio <- function(x) {
  dsujatha(x, theta = 2) /
    dgamma(x, shape = 2, rate = 0.5)
}

optimize(
  ratio,
  interval = c(0, 10),
  maximum = TRUE
)


devtools::document()

devtools::install(force = TRUE)

library(SujathaDist)

ls("package:SujathaDist")

set.seed(123)

x1 <- rsujatha(1000, theta = 2)

x2 <- rsujatha(1000,
               theta = 2,
               method = "inverse")

x3 <- rsujatha(1000,
               theta = 2,
               method = "rejection",
               lambda = 1.5)

summary(x1)
summary(x2)
summary(x3)

#Step 1: Test all functions
library(SujathaDist)

theta <- 2

## Density
dsujatha(0:5, theta)

## Distribution
psujatha(0:5, theta)

## Quantile
qsujatha(c(0.25,0.5,0.75), theta)

## Random generation
set.seed(123)
x <- rsujatha(1000, theta)

summary(x)
hist(x)

set.seed(123)

x <- rsujatha(10000, theta = 2)

hist(x,
     probability = TRUE,
     breaks = 40,
     main = "Sujatha Distribution")

curve(dsujatha(x, theta = 2),
      from = 0,
      to = max(x),
      add = TRUE,
      lwd = 2,
      col = "red")
mean(x)
integrate(function(x)
  x * dsujatha(x, theta = 2),
  0,
  Inf)
mean_sujatha(theta = 2)
x <- seq(0,8,length=200)

plot(x,
     psujatha(x,2),
     type="l",
     lwd=2,
     ylim=c(0,1))

u <- seq(0.01,0.99,0.01)

q <- qsujatha(u,2)

plot(u,q,type="l")

u <- runif(1000)

all.equal(
  psujatha(qsujatha(u,2),2),
  u,
  tolerance = 1e-6
)


integrate(function(x)
  dsujatha(x,2),
  0,
  Inf)


psujatha(0, 2)
psujatha(100, 2)

set.seed(123)

u <- runif(1000)

all.equal(
  psujatha(qsujatha(u, 2), 2),
  u,
  tolerance = 1e-6
)


set.seed(123)

x <- rsujatha(10000, theta = 2)

mean(x)

var(x)


hist(x,
     probability = TRUE,
     breaks = 40,
     main = "Sujatha Distribution")

curve(dsujatha(x, 2),
      add = TRUE,
      col = "red",
      lwd = 2)
devtools::check()
install.packages("Rtools")

##############

set.seed(123)

x <- rsujatha(10000,2)

ks.test(x,
        function(z) psujatha(z,2))
devtools::document()

devtools::build()

devtools::check()


install.packages("pkgbuild")
library(pkgbuild)

pkgbuild::has_build_tools(debug = TRUE)
install.packages("Rcpp", type = "source")

devtools::document()

devtools::build()

devtools::check()
R.version.string
R.version$major
R.version$minor
R.version.string
pkgbuild::has_build_tools(debug = TRUE)

devtools::document()
devtools::build()
devtools::check()
importFrom(stats,optimize)
importFrom(stats,dexp)
importFrom(stats,integrate)
importFrom(stats,rexp)
importFrom(stats,rgamma)
importFrom(stats,runif)
importFrom(stats,uniroot)

devtools::document()

devtools::load_all()

devtools::test()
devtools::check()
devtools::build()
install.packages("SujathaDist_0.1.0.tar.gz",
                 repos = NULL,
                 type = "source")
library(SujathaDist)

set.seed(123)

x <- rsujatha(100, theta = 2)

fit <- fitsujatha(x)

summary(fit)

gofsujatha(fit)
fitsujatha (x)

print.summary.fitsujatha <- function(x, ...) {

  cat("Parameter Estimates\n\n")

  print(data.frame(
    Estimate = x$estimate,
    Std.Error = x$se,
    z = x$z,
    p.value = x$p.value
  ))

  cat("\n95% Confidence Interval\n")

  print(x$conf.int)

  invisible(x)
}
str(print.summary.fitsujatha )


fit <- fitsujatha(x)

summary(fit)
print.summary(fit)
confint(fit)
s <- summary(fit)

names(s)

str(s$conf.int)



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

print.summary.fitsujatha <- function(x, ...) {

  cat("\nSummary of Fitted Sujatha Distribution\n")
  cat(rep("-",60), sep="")
  cat("\n\n")

  tab <- data.frame(
    Estimate
)
  print.fitsujatha(x)
  summary(fit)
  gofsujatha(fit)


  rownames(tab) <- names(x$estimate)
  print(tab)

  str(fit)
  names(fit)
  str(fit$estimate)
  rownames(tab) <- names(x$estimate)
  x <- rsujatha(100, theta = 2)
  class(x)
  fit <- fitsujatha(x)

  class(fit)
  str(fit$estimate)
  names(x$estimate)

  fit$estimate
  names(fit$estimate)
  theta_hat <- fit$par
  estimate <- theta_hat
  fit <- list(
    estimate = theta_hat,
    se = se,
    vcov = vcov,
    ...
  )


  estimate <- c(theta = theta_hat)

  fit <- list(
    estimate = estimate,
    se = se,
    ...
  )



  fit <- fitsujatha(x)
  fit



  >   fit <- fitsujatha(x)
  >   fit

  usethis::use_vignette("SujathaDist")
  install.packages("sass")
  install.packages(c(
    "rmarkdown",
    "knitr",
    "htmltools",
    "bslib"
  ))
  library(sass)
  devtools::check()

  devtools::document()
  devtools::install()

  library(SujathaDist)
  citation("SujathaDist")
  usethis::use_git()
  git config --global user.name ""

  git config --global user.name "hosenur72"
  git config --global user.email "hosenur72@gmail.com"
  git config --global user.name "Hosenur Rahman Prodhani"
  git config --global user.email "hosenur72@gmail.com"
  usethis::use_github()
  git --version
