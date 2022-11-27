
# c("id", "created_time", "name", "username","url", "avatar_url", "bio", "website",
#   "twitter_handle", "discord_handle", "balance", "total_deposits","profit_cached_all_time",
#   "profit_cached_daily", "profit_cached_monthly", "profit_cached_weekly")

testthat::test_that("GET /vX/user/[username] returns tibble", {
  resp <- manifold_api(endpoint = paste0("/",v,"/user/ManifoldMarkets"), request_type = "GET") |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/user/by-id/[id] returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/user/by-id/IPTOzEqrpkWmEzh6hwvAyY9PqFb2"),
    request_type = "GET"
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/me returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/me"),
    request_type = "GET",
    key = MANIFOLDR_USER_API_KEY
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/groups returns error", {
  expect_error(manifold_api(
    endpoint = paste0("/",v,"/groups"),
    request_type = "GET",
    params_list = list(availableToUserId = "true")
  ) |> clean_manifold_content(), "Group, comment, and bet data should not")
})

testthat::test_that("GET /vX/group/[slug] returns error", {
  expect_error(manifold_api(
    endpoint = paste0("/",v,"/group/manifold-users"),
    request_type = "GET",
    params_list = list(availableToUserId = "true")
  ) |> clean_manifold_content(), "Group, comment, and bet data should not")
})

testthat::test_that("GET /vX/group/by-id/[id] returns error", {
  expect_error(manifold_api(
    endpoint = paste0("/",v,"/group/by-id/uqVbahk6EJpQP9aKuZiX"),
    request_type = "GET",
    params_list = list(availableToUserId = "true")
  ) |> clean_manifold_content(), "Group, comment, and bet data should not")
})

testthat::test_that("GET /vX/group/by-id/[id]/markets returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/group/by-id/uqVbahk6EJpQP9aKuZiX/markets"),
    request_type = "GET"
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/markets returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/markets"),
    request_type = "GET",
    params_list = list(limit = 10, before = "pOIULRJ4zbYyk6dYEmzl")
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/market/[marketId] returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/market/pOIULRJ4zbYyk6dYEmzl"),
    request_type = "GET"
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/slug/[marketSlug] returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/slug/will-democrats-lose-their-majoritie"),
    request_type = "GET"
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/users returns tibble", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/users"),
    request_type = "GET",
    params_list = list(limit = 10, before = "GIGRbUjZdsd2Rv4Jlmx7GFSPZjj2")
  ) |>
    clean_manifold_content()
  expect_s3_class(resp, "tbl_df")
})

testthat::test_that("GET /vX/comments returns error", {
  expect_error(manifold_api(
    endpoint = paste0("/",v,"/comments"),
    request_type = "GET",
    params_list = list(
      contractId = "44Q7XDgbrDR2CyD2d41d"
    )) |> clean_manifold_content(), regexp = "Group, comment, and bet data should not")
})

testthat::test_that("GET /vX/bets returns tibble", {
  expect_error(manifold_api(
    endpoint = paste0("/",v,"/bets"),
    request_type = "GET",
    params_list = list(
      contractId = "44Q7XDgbrDR2CyD2d41d"
    )
  ) |> clean_manifold_content(), regexp = "Group, comment, and bet data should not")
})

testthat::test_that("class error works", {
  expect_error(manifold_api(endpoint = paste0("/",v,"/user/ManifoldMarkets"), request_type = "GET")$content |> clean_manifold_content(), regexp = "Function input should")
})
