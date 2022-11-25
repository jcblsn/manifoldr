#' get_markets()
#'
#' Retrieve recent markets from most to least recent.
#'
#' @param n_markets Number of markets to retrieve
#' @return A JSON object
#' @export
#' @examples
#' get_markets(2500)

get_markets <- function(n_markets = 100){
  if(n_markets<=1000){
    markets <- manifold_api(path = "/v0/markets", params_list = list("limit" = n_markets))
  } else if (n_markets > 1000) {

    retrieved_markets <- 0
    markets <- manifold_api(path = "/v0/markets", params_list = list("limit" = "1000"))
    markets$response <- list(markets$response)
    before_id = out$content[[length(out$content)]]$id
    retrieved_markets <- retrieved_markets+length(out$content)

    while(retrieved_markets<n_markets) {
      limit_n <- ifelse((n_markets-retrieved_markets)<=1000,n_markets-retrieved_markets,1000)
      out <- manifold_api(path = "/v0/markets", params_list = list("limit" = limit_n, "before" = before_id))
      markets$content <- append(markets$content, out$content)
      markets$response <- append(markets$response, list(out$response))
      before_id = out$content[[length(out$content)]]$id
      retrieved_markets <- retrieved_markets+length(out$content)
    }
  }
  return(markets)
}
