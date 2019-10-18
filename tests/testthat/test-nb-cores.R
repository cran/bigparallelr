################################################################################

context("test-nb-cores")

################################################################################

test_that("nb_cores() works", {
  expect_lt(nbc <- nb_cores(), parallel::detectCores())
})

test_that("assert_cores() works", {

  options(bigstatsr.ncores.max = 1)
  expect_null(assert_cores(1))
  expect_error(assert_cores(2), "You are trying to use more cores than allowed.")

  options(bigstatsr.ncores.max = Inf)
  expect_null(assert_cores(1))
  expect_null(assert_cores(nb_cores()))
  expect_null(assert_cores(parallel::detectCores() + 1))

  options(bigstatsr.ncores.max = parallel::detectCores())
  expect_null(assert_cores(1))
  expect_error(assert_cores(parallel::detectCores() + 1),
               "You are trying to use more cores than allowed.")
})

################################################################################