secret_scrambled <- "mngT0rXXiwoF2RhqXZmlgcGn778wfF5ne-0SwoXUO7Q4G8uJHOnYM7s0io0h9sFB5VwHig"
MANIFOLDR_USER_API_KEY <- httr2::secret_decrypt(secret_scrambled, "MANIFOLDR_PACKAGE_KEY")

test_that("GET /v0/user/[username] works", {
  resp <- manifold_api(endpoint = "/v0/user/ManifoldMarkets", request_type = "GET")
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

test_that("GET /v0/user/by-id/[id] works", {
  resp <- manifold_api(endpoint = "/v0/user/by-id/IPTOzEqrpkWmEzh6hwvAyY9PqFb2", request_type = "GET")
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

test_that("GET /v0/me", {
  resp <- manifold_api(
    endpoint = "/v0/user/by-id/IPTOzEqrpkWmEzh6hwvAyY9PqFb2",
    request_type = "GET",
    key = MANIFOLDR_USER_API_KEY
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})
