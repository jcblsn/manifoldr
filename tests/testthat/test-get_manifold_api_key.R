secret_scrambled <- "mngT0rXXiwoF2RhqXZmlgcGn778wfF5ne-0SwoXUO7Q4G8uJHOnYM7s0io0h9sFB5VwHig"
MANIFOLDR_USER_API_KEY <- httr2::secret_decrypt(secret_scrambled, "MANIFOLDR_PACKAGE_KEY")

testthat::test_that("function produces error when key not set", {
  testthat::expect_error(get_manifold_api_key())
})

Sys.setenv(MANIFOLD_API_KEY = MANIFOLDR_USER_API_KEY)

testthat::test_that("function produces 36 digit key when env var has been set", {
  testthat::expect_equal(stringr::str_length(get_manifold_api_key()), 36)
})

testthat::test_that("function produces 36 digit key when env var has been set", {
  testthat::expect_equal(stringr::str_length(get_manifold_api_key()), 36)
})

testthat::test_that("key successfully authenticates", {
  resp <- manifold_api(
    endpoint = "/v0/me",
    request_type = "GET",
    key = get_manifold_api_key()
  )
  testthat::expect_equal(resp$response$status_code, 200)
})

