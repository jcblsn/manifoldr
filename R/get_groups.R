#' get_groups()
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Retrieve all Manifold Markets groups.
#'
#' @param key A Manifold Markets API key for authentication
#' @return Double
#' @export

get_groups <- function(){
  manifold_api(endpoint = "/v0/groups", request_type = "GET")
}

# usethis::use_test("get_groups.R")
