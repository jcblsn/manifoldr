#' get_markets()
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' Retrieve recent markets from most to least recent.
#'
#' @param n_markets Number of markets to retrieve
#' @return A JSON object
#' @examples
#' get_markets(5)
#' @export

get_markets <- function(n_markets = 100){
  maximum_n_return <- 1000 # per API docs
  if(n_markets<=maximum_n_return){
    markets <- manifold_api(
      endpoint = "/v0/markets",
      request_type = "GET",
      params_list = list("limit" = n_markets)
    )
  } else if (n_markets > maximum_n_return) {

    retrieved_markets <- 0
    markets <- manifold_api(
      endpoint = "/v0/markets",
      request_type = "GET",
      params_list = list("limit" = 1000)
    )
    markets$response <- list(markets$response)
    before_id = markets$content[[length(markets$content)]]$id
    retrieved_markets <- retrieved_markets+length(markets$content)

    while(retrieved_markets<n_markets) {
      limit_n <- ifelse((n_markets-retrieved_markets)<=maximum_n_return,
                        n_markets-retrieved_markets,maximum_n_return)
      out <- manifold_api(
        endpoint = "/v0/markets",
        request_type = "GET",
        params_list =
          list("limit" = limit_n, "before" = before_id)
      )
      markets$content <- append(markets$content, out$content)
      markets$response <- append(markets$response, list(out$response))
      before_id = out$content[[length(out$content)]]$id
      retrieved_markets <- retrieved_markets+length(out$content)
    }
  }
  return(markets)
}
