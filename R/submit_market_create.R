#' submit_market_create
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Create a new market
#'
#' @param mm_key A Manifold Markets API key for authentication
#' @param mm_outcome_type Required. One of `BINARY`, `FREE_RESPONSE`, `MULTIPLE_CHOICE`, or `PSEUDO_NUMERIC`
#' @param mm_question Required. The headline question for the market.
#' @param mm_description_md Optional. A long description describing the rules for the market. Supports markdown notation for rich text formatting.
#' @param mm_close_time Optional. The time at which the market will close, represented as milliseconds since the epoch. Defaults to 7 days from now.
#' @param mm_visibility Optional. One of `public` (default) or `unlisted`. Controls whether the market is shown on the homepage.
#' @param mm_group_id Optional. A group to create this market under.
#' @param mm_initial_prob Required for binary markets. An initial probability for the market, between 1 and 99.
#' @param mm_min Required for numeric markets. The minimum value that the market may resolve to.
#' @param mm_max Required for numeric markets. The maximum value that the market may resolve to.
#' @param mm_is_log_scale Required for numeric markets. If true, your numeric market will increase exponentially from min to max.
#' @param mm_initial_value Required for numeric markets. An initial value for the market, between min and max, exclusive.
#' @param mm_answers Required for multiple choice markets. An array of strings, each of which will be a valid answer for the market.
#' @return Manifold API object
#' @export

submit_market_create <- function(
    mm_key = get_manifold_api_key(),
    mm_outcome_type = c("BINARY", "FREE_RESPONSE", "MULTIPLE_CHOICE", "PSEUDO_NUMERIC"),
    mm_question,
    mm_description_md,
    mm_close_time,
    mm_visibility = c("public","unlisted"),
    mm_group_id,
    mm_initial_prob,
    mm_min,
    mm_max,
    mm_is_log_scale,
    mm_initial_value,
    mm_answers
){

  test_param_given <- function(param){
    out <- if(exists(deparse(substitute(param)))){
      return(param)
    } else {
      return(NULL)
    }
  }

  match.arg(mm_outcome_type)
  match.arg(mm_visibility)

  params_list <- list(
    outcomeType = test_param_given(mm_outcome_type),
    question = test_param_given(mm_question),
    descriptionMarkdown = test_param_given(mm_description_md),
    closeTime = test_param_given(mm_close_time),
    visibility = test_param_given(mm_visibility),
    groupId = test_param_given(mm_group_id),
    initialProb = test_param_given(mm_initial_prob),
    min = test_param_given(eval(mm_min)),
    max = test_param_given(eval(mm_max)),
    isLogScale = test_param_given(eval(mm_is_log_scale)),
    initialValue = test_param_given(eval(mm_initial_value)),
    answers = test_param_given(eval(mm_answers))
  )

  params_list <- params_list[lengths(params_list) != 0] # remove null elements

  manifold_api(
    endpoint = "/v0/market",
    request_type = "POST",
    key = mm_key,
    params_list = params_list
  )
}

# TODO add documentation, error checking, tests
# usethis::use_test("submit_market_create.R")

# TODO validate closeTime to be in the future

