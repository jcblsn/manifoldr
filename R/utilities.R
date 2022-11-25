ua <- httr::user_agent("http://github.com/eliason-j/manifoldr")

# NOTE: doesn't appear to be a limit yet? update later

# rate_limit <- function() {
#   req <- manifold_api("/rate_limit")
#   core <- req$content$resources$core
#
#   reset <- as.POSIXct(core$reset, origin = "1970-01-01")
#   cat(core$remaining, " / ", core$limit,
#       " (Resets at ", strftime(reset, "%H:%M:%S"), ")\n", sep = "")
# }

manifold_api_key <- function() {
  pat <- Sys.getenv('MANIFOLD_API_KEY')
  if (identical(pat, "")) {
    stop("Please set env var MANIFOLD_API_KEY to your Manifold API key using `Sys.setenv(). For more information about how to find your Manifold API key, try https://docs.manifold.markets/api", call. = FALSE)
  }
  pat
}
