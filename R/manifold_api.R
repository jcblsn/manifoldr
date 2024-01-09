#' Manifold API
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' Interact with the Manifold Markets API
#'
#' @param endpoint One of the endpoints listed in Manifold's [documentation](https://docs.manifold.markets/api)
#' @param request_type Must be one of "GET" or "POST" per endpoint documentation
#' @param key API key (see documentation for which endpoints require authentication)
#' @param params_list A list of parameter names and values (see documentation for syntax)
#' @return Manifold API object
#' @examples
#' manifold_api(
#'   endpoint = "/v0/user/ManifoldMarkets",
#'   request_type = "GET"
#' )
#' manifold_api(
#'   endpoint = "/v0/markets",
#'   request_type = "GET",
#'   params_list = list(limit = 10, before = "EvIhzcJXwhL0HavaszD7")
#' )
#' @import httr httr2
#' @importFrom jsonlite fromJSON
#' @importFrom utils str
#' @export

manifold_api <- function(endpoint, request_type = c("GET", "POST"), key = NULL, params_list = NULL) {

  url <- paste0("https://api.manifold.markets", endpoint)
  match.arg(request_type)

  # fix empty parameter list
  if(length(params_list)==0){
    params_list <- NULL
  }

  if(request_type == "GET"){
    request_args <- list(
      url,
      ua,
      httr::add_headers(Authorization = paste0("Key ", key)),
      query = params_list
    )
    request_args <- request_args[lengths(request_args) != 0] # remove null elements
    resp <- do.call(httr::GET, request_args)
  } else if(request_type == "POST") {

    if(!is.null(params_list)){
      params_list <- jsonlite::toJSON(params_list, auto_unbox = TRUE)
    }
    request_args <- list(
      url,
      ua,
      httr::add_headers(Authorization = paste0("Key ", key),
                        "Content-Type" = "application/json"),
      body = params_list
    )
    request_args <- request_args[lengths(request_args) != 0] # remove null elements
    resp <- do.call(httr::POST, request_args)
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
        "Please provide API key directly or using manifold_api(key = get_manifold_api_key())"
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
      path = endpoint,
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
