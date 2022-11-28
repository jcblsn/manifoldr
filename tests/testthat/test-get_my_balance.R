testthat::test_that("function returns numeric", {
  bal <- get_my_balance()
  testthat::expect_equal(class(bal), "numeric")
})
