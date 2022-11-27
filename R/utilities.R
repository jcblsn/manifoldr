v <- "v0"
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
