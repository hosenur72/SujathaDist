library(SujathaDist)

test_that("CDF lies between 0 and 1", {

  p <- psujatha(seq(0, 10, length.out = 100), 2)

  expect_true(all(p >= 0))

  expect_true(all(p <= 1))

})

test_that("CDF is increasing", {

  p <- psujatha(seq(0,10,length.out=100),2)

  expect_true(all(diff(p) >= 0))

})

test_that("CDF limits", {

  expect_equal(psujatha(0,2),0,tolerance=1e-8)

  expect_equal(psujatha(100,2),1,tolerance=1e-5)

})
