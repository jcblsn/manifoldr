#' Manifold API
#'
#' Interact with the Manifold Markets API
#'
#' @param path One of the endpoints listed in Manifold's [documentation](https://docs.manifold.markets/api)
#' @param key Optional: provide API key
#' @param params_list Optional: provide a list of parameters names and values (see doc for syntax)
#' @return A JSON object
#' @export
#' @examples
#' manifold_api("/v0/user/ManifoldMarkets")
#' manifold_api("/v0/me", key = manifold_api_key())
#' manifold_api(path = "/v0/markets", params_list = list("limit" = "10", "before" = "EvIhzcJXwhL0HavaszD7"))

manifold_api <- function(path, key = NULL, params_list = NULL) {

  # url <- modify_url("https://manifold.markets/api/", path = path)
  url <- paste0("https://manifold.markets/api", path)

  # Authenticate if key provided
  if(!is.null(key)){
    resp <-
      httr::GET(
        url, ua,
        httr::add_headers(Authorization = paste0("Key ", key))
      )
    # Pass parameters
  } else if(!is.null(params_list)) {
    resp <-
      do.call(
        httr::GET,
        list(url, ua, query = params_list)
      )
  } else{
    resp <- httr::GET(url, ua)
  }

  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  # Format error message
  if (httr::status_code(resp) == 403){
    stop(
      paste0(
        "Manifold API request failed\nStatus code: ",
        httr::status_code(resp),"\n",
        parsed$message,
        parsed$documentation_url,"\n",
        "Please provide API key using manifold_api(key = manifold_api_key())"
      ),
      call. = F
    )
  } else if (httr::status_code(resp) != 200) {
    stop(
      paste0(
        "Manifold API request failed\nStatus code: ",
        httr::status_code(resp),"\n",
        parsed$message,
        parsed$documentation_url
      ),
      call. = F
    )
  }

  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "manifold_api"
  )
}

# Provide clean print method
print.manifold_api <- function(x, ...) {
  cat("<Manifold ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
