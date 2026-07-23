library(SujathaDist)

test_that("Density is non-negative", {

  x <- seq(0, 10, length.out = 100)

  d <- dsujatha(x, theta = 2)

  expect_true(all(d >= 0))

})

test_that("Density integrates to one", {

  I <- integrate(
    function(x) dsujatha(x, theta = 2),
    0,
    Inf
  )

  expect_equal(I$value, 1, tolerance = 1e-6)

})

test_that("Invalid theta throws error", {

  expect_error(dsujatha(1, theta = -1))

})
