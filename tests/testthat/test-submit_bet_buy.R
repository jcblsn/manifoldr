secret_scrambled <- "mngT0rXXiwoF2RhqXZmlgcGn778wfF5ne-0SwoXUO7Q4G8uJHOnYM7s0io0h9sFB5VwHig"
MANIFOLDR_USER_API_KEY <- httr2::secret_decrypt(secret_scrambled, "MANIFOLDR_PACKAGE_KEY")

# endpoints ---------------------------------------------------------------

testthat::test_that("multiplication works", {
  testthat::expect_equal(2 * 2, 4)
})

testthat::test_that("POST /vX/bet/ works", {
  resp <- submit_bet_buy(
    mm_key = MANIFOLDR_USER_API_KEY,
    mm_amt = 10,
    mm_market_id = "44Q7XDgbrDR2CyD2d41d",
    mm_outcome = sample(c("YES","NO"),1)
  )
  testthat::expect_s3_class(resp, class = "manifold_api")
  testthat::expect_equal(resp$response$status_code, 200)
})
