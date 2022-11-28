
testthat::test_that("class is correct", {
  resp <- get_users(n_users = 1)
  expect_s3_class(resp, class = "manifold_api")
})

testthat::test_that("n items is correct", {
  n_check <- 3
  resp <- get_users(n_users = n_check)
  expect_equal(length(resp$content), n_check)
})

testthat::test_that("n > 1000 items are correctly retrieved", {
  n_check <- 1001
  resp <- get_users(n_users = n_check)
  expect_equal(length(resp$content), n_check)
})
