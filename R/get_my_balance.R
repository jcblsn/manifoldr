#' get_my_balance()
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' Retrieve the authenticated user's mana balance.
#'
#' @param key A Manifold Markets API key for authentication
#' @return Double
#' @export

get_my_balance <- function(key = get_manifold_api_key()){
  manifold_api(
    "/v0/me",
    request_type = "GET",
    key = key
  )$content$balance
}

# usethis::use_test("get_my_balance.R")
