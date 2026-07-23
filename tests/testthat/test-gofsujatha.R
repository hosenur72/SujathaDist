library(SujathaDist)

test_that("GOF returns class", {

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  g <- gofsujatha(fit)

  expect_s3_class(g,"gofsujatha")

})

test_that("KS p-value between 0 and 1", {

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  g <- gofsujatha(fit)

  expect_true(g$KS.pvalue >= 0)

  expect_true(g$KS.pvalue <= 1)

})

test_that("Information criteria finite", {

  x <- rsujatha(100,2)

  fit <- fitsujatha(x)

  g <- gofsujatha(fit)

  expect_true(is.finite(g$AIC))

  expect_true(is.finite(g$BIC))

})
