library(SujathaDist)

test_that("Quantile inverts CDF", {

  p <- seq(0.05,0.95,0.05)

  q <- qsujatha(p,2)

  expect_equal(
    psujatha(q,2),
    p,
    tolerance=1e-6
  )

})

test_that("Invalid probabilities produce error", {

  expect_error(qsujatha(-0.2,2))

  expect_error(qsujatha(1.2,2))

})
