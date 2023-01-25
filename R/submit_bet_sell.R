#' submit_bet_sell
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Create a new market
#'
#' @param mm_key A Manifold Markets API key for authentication
#' @return Manifold API object
#' @export

submit_bet_sell <- function(
    mm_key = get_manifold_api_key(),
    mm_shares = NULL,
    mm_market_id = NULL,
    mm_market_slug = NULL
){

  test_param_given <- function(param){
    out <- if(exists(deparse(substitute(param)))){
      return(param)
    } else {
      return(NULL)
    }
  }

  if(is.null(mm_market_id) & is.null(mm_market_slug)){
    stop("Please provide exactly one market ID or market slug")
  }

  if(!is.null(mm_market_slug)){
    mm_market_id <- manifoldr::get_market(slg)$content$id
  }

  params_list <- list(
    shares = test_param_given(mm_shares)
  )

  params_list <- params_list[lengths(params_list) != 0] # remove null elements

  manifold_api(
    endpoint = paste0("/v0/market/",mm_market_id,"/sell"),
    request_type = "POST",
    key = mm_key,
    params_list = params_list
  )
}

# TODO add documentation, error checking, tests
# usethis::use_test("submit_bet_sell.R")
