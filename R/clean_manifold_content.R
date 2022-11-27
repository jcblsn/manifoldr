#' Convert API response to a data frame
#'
#' An optional convenience function to format results from the Manifold API
#'
#' @param input The result from manifold_api() or other
#' @return A data frame
#' @examples
#' clean_manifold_content(manifold_api("/v0/user/ManifoldMarkets", request_type = "GET"))
#' @importFrom purrr map_dfr pluck
#' @importFrom janitor clean_names
#' @export

clean_manifold_content <- function(input){

  if (!inherits(input,"manifold_api")) {
    stop("Function input should be Manifold API object.", call. = FALSE)
  }

  out <- purrr::map_dfr(
    input$content,
    function(x) x %>% purrr::pluck() |> unlist() |> t() |> data.frame()
  ) |>
    janitor::clean_names()
  return(out)
}
