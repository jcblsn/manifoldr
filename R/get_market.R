#' get_market()
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' Retrieve a specific market
#'
#' @param market_id_or_slug A slug or ID associated with a single market
#' @return Manifold API object
#' @examples
#' get_market("pOIULRJ4zbYyk6dYEmzl")
#' get_market("will-democrats-lose-their-majoritie")
#' @importFrom stringr str_length str_detect
#' @export

get_market <- function(market_id_or_slug){

  if(!inherits(market_id_or_slug, "character")) {
    stop("Please provide a string market id or slug", call. = FALSE)
  } else if(market_id_or_slug == ""){
    stop("Please provide a non-empty market id or slug", call. = FALSE)
  }
  if(
    # test for length 20 and no non alpha-numerics
    stringr::str_length(market_id_or_slug) == 20 &
    !stringr::str_detect(market_id_or_slug, "[^a-zA-Z0-9]")
  ) {
    resp <- manifold_api(
      endpoint = paste0("/",v,"/market/",market_id_or_slug),
      request_type = "GET"
    )
  } else {
    resp <- manifold_api(
      endpoint = paste0("/",v,"/slug/will-democrats-lose-their-majoritie"),
      request_type = "GET"
    )
  }
  return(resp)
}

# usethis::use_test("get_market.R")
