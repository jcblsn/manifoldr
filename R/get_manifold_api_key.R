#' Reference your Manifold Markets API Key
#'
#' Reference your Manifold Markets API Key after it's been stored as a system environment variable.
#'
#' @return API key as string
#' @export
#' @examples
#' manifold_api_key()

get_manifold_api_key <- function() {
  pat <- Sys.getenv('MANIFOLD_API_KEY')
  if (identical(pat, "")) {
    stop("Please set env var MANIFOLD_API_KEY to your Manifold API key using `Sys.setenv(). For more information about how to find your Manifold API key, try https://docs.manifold.markets/api", call. = FALSE)
  }
  pat
}
