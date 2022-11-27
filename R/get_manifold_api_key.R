#' Storing and referencing your Manifold Markets API Key
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' @return API key as string
#' @export

get_manifold_api_key <- function() {
  pat <- Sys.getenv('MANIFOLD_API_KEY')
  if (identical(pat, "")) {
    stop("Please set env var MANIFOLD_API_KEY to your Manifold API key using `Sys.setenv(MANIFOLD_API_KEY = '<YOUR KEY>'). For more information about how to find your Manifold API key, try https://docs.manifold.markets/api", call. = FALSE)
  }
  pat
}
