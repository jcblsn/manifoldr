
testthat::test_that("class is correct", {
  resp <- get_groups()
  expect_s3_class(resp, class = "manifold_api")
})

