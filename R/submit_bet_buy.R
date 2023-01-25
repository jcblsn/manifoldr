#' submit_bet_buy
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Create a new market
#'
#' @param mm_key A Manifold Markets API key for authentication
#' @return Manifold API object
#' @export

submit_bet_buy <- function(
    mm_key = get_manifold_api_key(),
    mm_amt,
    mm_market_id = NULL,
    mm_market_slug = NULL,
    mm_outcome = c("YES","NO"),
    mm_limit = NULL
){

  test_param_given <- function(param){
    out <- if(exists(deparse(substitute(param)))){
      return(param)
    } else {
      return(NULL)
    }
  }

  match.arg(mm_outcome)

  if(is.null(mm_market_id) & is.null(mm_market_slug)){
    stop("Please provide exactly one market ID or market slug")
  }

  if(!is.null(mm_market_slug)){
    mm_market_id <- manifoldr::get_market(slg)$content$id
  }

  params_list <- list(
    amount = test_param_given(mm_amt),
    contractId = test_param_given(mm_market_id),
    outcome = test_param_given(mm_outcome),
    limitProb = test_param_given(mm_limit)
  )

  params_list <- params_list[lengths(params_list) != 0] # remove null elements

  manifold_api(
    endpoint = "/v0/bet",
    request_type = "POST",
    key = mm_key,
    params_list = params_list
  )
}

# TODO add documentation, error checking, tests
usethis::use_test("submit_bet_buy.R")
