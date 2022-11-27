#' Convert API response to a data frame
#'
#' An optional helper function to clean up the result from the Manifold API
#'
#' @param input The result from manifold_api() or other
#' @return A data frame
#' @examples
#' clean_manifold_content(manifold_api("/v0/user/ManifoldMarkets"))
#' @importFrom purrr map_dfr pluck
#' @importFrom janitor clean_names
#' @export

clean_manifold_content <- function(input){
  out <- purrr::map_dfr(
    input,
    function(x) x %>% purrr::pluck() |> unlist() |> t() |> data.frame()
  ) |>
    janitor::clean_names()
}

