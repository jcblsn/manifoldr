secret_scrambled <- "mngT0rXXiwoF2RhqXZmlgcGn778wfF5ne-0SwoXUO7Q4G8uJHOnYM7s0io0h9sFB5VwHig"
MANIFOLDR_USER_API_KEY <- httr2::secret_decrypt(secret_scrambled, "MANIFOLDR_PACKAGE_KEY")
Sys.setenv(MANIFOLD_API_KEY = MANIFOLDR_USER_API_KEY)

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
