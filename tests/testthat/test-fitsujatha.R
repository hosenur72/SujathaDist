library(SujathaDist)

test_that("MLE returns correct class", {

  set.seed(123)

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  expect_s3_class(fit,"fitsujatha")

})

test_that("Estimate is positive", {

  x <- rsujatha(200,2)

  fit <- fitsujatha(x)

  expect_true(fit$estimate > 0)

})

test_that("Standard error positive", {

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  expect_true(fit$se > 0)

})

test_that("LogLik finite", {

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  expect_true(is.finite(fit$logLik))

})

test_that("AIC smaller than Inf", {

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  expect_true(is.finite(fit$AIC))

})
