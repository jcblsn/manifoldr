secret_scrambled <- "mngT0rXXiwoF2RhqXZmlgcGn778wfF5ne-0SwoXUO7Q4G8uJHOnYM7s0io0h9sFB5VwHig"
MANIFOLDR_USER_API_KEY <- httr2::secret_decrypt(secret_scrambled, "MANIFOLDR_PACKAGE_KEY")

# endpoints ---------------------------------------------------------------

testthat::test_that("GET /vX/user/[username] works", {
  resp <- manifold_api(endpoint = paste0("/",v,"/user/ManifoldMarkets"), request_type = "GET")
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/user/by-id/[id] works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/user/by-id/IPTOzEqrpkWmEzh6hwvAyY9PqFb2"),
    request_type = "GET"
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/me works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/me"),
    request_type = "GET",
    key = MANIFOLDR_USER_API_KEY
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/groups works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/groups"),
    request_type = "GET",
    params_list = list(availableToUserId = "true")
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/group/[slug] works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/group/manifold-users"),
    request_type = "GET"
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/group/by-id/[id] works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/group/by-id/uqVbahk6EJpQP9aKuZiX"),
    request_type = "GET"
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/group/by-id/[id]/markets works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/group/by-id/uqVbahk6EJpQP9aKuZiX/markets"),
    request_type = "GET"
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/markets works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/markets"),
    request_type = "GET",
    params_list = list(limit = 10, before = "pOIULRJ4zbYyk6dYEmzl")
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/market/[marketId] works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/market/pOIULRJ4zbYyk6dYEmzl"),
    request_type = "GET"
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

# TODO figure out why bets and comments don't work
# RESOLVED apparently was removed per changelog

# testthat::test_that("GET /vX/market/[marketId] works with bets and comments", {
#   resp <- manifold_api(
#     endpoint = paste0("/",v,"/market/X1Yz7ipF4zkLuLkHtPeK/bets"),
#     # endpoint = paste0("/",v,"/bets/X1Yz7ipF4zkLuLkHtPeK"),
#     request_type = "GET"
#   )
#   expect_s3_class(resp, class = "manifold_api")
#   expect_equal(resp$response$status_code, 200)
# })

testthat::test_that("GET /vX/slug/[marketSlug] works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/slug/will-democrats-lose-their-majoritie"),
    request_type = "GET"
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/users works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/users"),
    request_type = "GET",
    params_list = list(limit = 10, before = "GIGRbUjZdsd2Rv4Jlmx7GFSPZjj2")
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

# testthat::test_that("POST /vX/market works", {
#   resp <- manifold_api(
#     endpoint = paste0("/",v,"/market"),
#     request_type = "POST",
#     key = MANIFOLDR_USER_API_KEY,
#     params_list = list(
#       outcomeType = "BINARY",
#       question = "Will the manifoldr package functions work correctly?",
#       descriptionMarkdown = "This market exists to test the package functions for [manifoldr](https://github.com/jcblsn/manifoldr). For testing purposes only.",
#       closeTime = 1679558804490,
#       visibility = "unlisted",
#       groupId = "gPyUYrZXv9YfceerIphj",
#       initialProb = 50
#     )
#   )
#   expect_s3_class(resp, class = "manifold_api")
#   expect_equal(resp$response$status_code, 200)
# })
# passed 2022-11-27
# id 44Q7XDgbrDR2CyD2d41d
# slug will-the-manifoldr-package-function
# url https://manifold.markets/manifoldr/will-the-manifoldr-package-function

testthat::test_that("POST /vX/bet works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/bet"),
    request_type = "POST",
    key = MANIFOLDR_USER_API_KEY,
    params_list = list(
      contractId = "44Q7XDgbrDR2CyD2d41d",
      outcome = "YES",
      amount = 1
      # , limitProb = round(0.511,2)
    )
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})
# passed 2022-11-27

testthat::test_that("POST /vX/market/[marketId]/add-liquidity works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/market/44Q7XDgbrDR2CyD2d41d/add-liquidity"),
    request_type = "POST",
    key = MANIFOLDR_USER_API_KEY,
    params_list = list(
      amount = 1
    )
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})
# passed 2022-11-27

# testthat::test_that("POST /vX/market/[marketId]/close works", {
#   resp <- manifold_api(
#     endpoint = paste0("/",v,"/market/44Q7XDgbrDR2CyD2d41d/close"),
#     request_type = "POST",
#     key = MANIFOLDR_USER_API_KEY
#     # , params_list = list(
#       # closeTime = <TIME>
#     # )
#   )
#   expect_s3_class(resp, class = "manifold_api")
#   expect_equal(resp$response$status_code, 200)
# })

# testthat::test_that("POST /vX/market/[marketId]/resolve works", {
#   manifoldr_group_markets <- manifold_api(
#     endpoint = paste0("/",v,"/group/by-id/gPyUYrZXv9YfceerIphj/markets"),
#     request_type = "GET"
#   ) |> clean_manifold_content()
#
#   market_id <-
#     manifoldr_group_markets[manifoldr_group_markets$created_time == max(manifoldr_group_markets$created_time),]$id
#
#   resp <- manifold_api(
#     endpoint = paste0("/",v,"/market/",market_id,"/resolve"),
#     request_type = "POST",
#     key = MANIFOLDR_USER_API_KEY,
#     params_list = list(
#       outcome = "CANCEL"
#     )
#   )
#   expect_s3_class(resp, class = "manifold_api")
#   expect_equal(resp$response$status_code, 200)
# })

testthat::test_that("POST /vX/market/[marketId]/sell works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/market/44Q7XDgbrDR2CyD2d41d/sell"),
    request_type = "POST",
    key = MANIFOLDR_USER_API_KEY,
    params_list = list(
      outcome = "YES"
    )
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})
# passed 2022-11-27

# testthat::test_that("POST /vX/comment works", {
#   resp <- manifold_api(
#     endpoint = paste0("/",v,"/comment"),
#     request_type = "POST",
#     key = MANIFOLDR_USER_API_KEY,
#     params_list = list(
#       contractId = "44Q7XDgbrDR2CyD2d41d",
#       markdown = "*Testing comment functionality.*"
#     )
#   )
#   expect_s3_class(resp, class = "manifold_api")
#   expect_equal(resp$response$status_code, 200)
# })

testthat::test_that("GET /vX/comments works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/comments"),
    request_type = "GET",
    params_list = list(
      contractId = "44Q7XDgbrDR2CyD2d41d"
    )
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

testthat::test_that("GET /vX/bets works", {
  resp <- manifold_api(
    endpoint = paste0("/",v,"/bets"),
    request_type = "GET",
    params_list = list(
      contractId = "44Q7XDgbrDR2CyD2d41d"
    )
  )
  expect_s3_class(resp, class = "manifold_api")
  expect_equal(resp$response$status_code, 200)
})

# manifold_api ------------------------------------------------------------

testthat::test_that("request type check works", {
  testthat::expect_error(
    manifold_api(endpoint = paste0("/",v,"/user/ManifoldMarkets"), request_type = "GFT"), # need GET or POST
    "should be one of"
  )
})

testthat::test_that("403 error works", {
  testthat::expect_error(
    manifoldr::manifold_api(endpoint = paste0("/",v,"/me"), request_type = "GET"), # no key
    "Status code: 403"
  )
})

testthat::test_that("non-200 error works", {
  testthat::expect_error(
    manifold_api(
      endpoint = paste0("/",v,"/markets"),
      request_type = "GET",
      params_list = list(limit = T, before = T) # bad params
    ),
    "Manifold API request failed")
})

testthat::test_that("print method works", {
  resp <- manifold_api(endpoint = paste0("/",v,"/user/ManifoldMarkets"), request_type = "GET")
  resp$content
  expect_no_error(resp$content)
})

