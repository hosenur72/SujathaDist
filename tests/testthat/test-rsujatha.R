library(SujathaDist)

test_that("Correct sample size", {

  x <- rsujatha(100,2)

  expect_equal(length(x),100)

})

test_that("Generated values are positive", {

  x <- rsujatha(500,2)

  expect_true(all(x >= 0))

})

test_that("Sample mean is reasonable", {

  set.seed(123)

  x <- rsujatha(10000,2)

  m <- mean(x)

  expect_true(is.finite(m))

})
