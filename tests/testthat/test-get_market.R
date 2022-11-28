testthat::test_that("parameter class check works", {
  testthat::expect_error(
    get_market(NULL),
    regexp = "Please provide a string"
  )
})

testthat::test_that("parameter empty check works", {
  testthat::expect_error(
    get_market(""),
    regexp = "Please provide a non-empty"
  )
})

testthat::test_that("market id works", {
  resp <- get_market("pOIULRJ4zbYyk6dYEmzl")
  testthat::expect_s3_class(resp, class = "manifold_api")
  testthat::expect_equal(resp$response$status_code, 200)
})

testthat::test_that("market slug works", {
  resp <- get_market("will-democrats-lose-their-majoritie")
  testthat::expect_s3_class(resp, class = "manifold_api")
  testthat::expect_equal(resp$response$status_code, 200)
})

