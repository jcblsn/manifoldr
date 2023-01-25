secret_scrambled <- "mngT0rXXiwoF2RhqXZmlgcGn778wfF5ne-0SwoXUO7Q4G8uJHOnYM7s0io0h9sFB5VwHig"
MANIFOLDR_USER_API_KEY <- httr2::secret_decrypt(secret_scrambled, "MANIFOLDR_PACKAGE_KEY")

# endpoints ---------------------------------------------------------------

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

testthat::test_that("POST /vX/market/ works", {
    resp <- submit_market_create(
      mm_key = MANIFOLDR_USER_API_KEY,
      mm_outcome_type = "BINARY",
      mm_question = "Will the manifoldr package functions work correctly?",
      mm_description_md = "This market exists to test the package functions for [manifoldr](https://github.com/jcblsn/manifoldr). For testing purposes only.",
      mm_close_time = 1679558804490,
      mm_visibility = "unlisted",
      mm_group_id = "gPyUYrZXv9YfceerIphj",
      mm_initial_prob = 50
    )
    expect_s3_class(resp, class = "manifold_api")
    expect_equal(resp$response$status_code, 200)
})
