#' Convert API response to a data frame
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' An optional convenience function to format certain results from the Manifold API
#'
#' @param input Output from manifold_api() or other convenience function. Output from queries regarding groups, comments, or bets are not currently compatible with this function.
#' @return A tibble
#' @examples
#' clean_manifold_content(manifold_api("/v0/user/ManifoldMarkets", request_type = "GET"))
#' @importFrom purrr map_dfr pluck
#' @importFrom janitor clean_names
#' @importFrom dplyr mutate_all case_when
#' @importFrom tidyselect any_of
#' @importFrom stringr str_starts regex
#' @importFrom tibble as_tibble
#' @importFrom lubridate as_datetime
#' @export

clean_manifold_content <- function(input){

  if (!inherits(input,"manifold_api")) {
    stop("Function input should be Manifold API object.", call. = FALSE)
  }

  if(
    stringr::str_starts(input$path, paste0("/",v,"/group","|",
                                           "/",v,"/comment","|"
                                           ,"/",v,"/bets" # todo come back to these
    )) &
    !stringr::str_starts(input$path, stringr::regex(paste0("/",v,"/group/by-id/","[a-zA-Z0-9_.-]*","/markets")))
  ) {
    stop("Group, comment, and bet data should not be passed to clean_manifold_content() due to non-rectangular structure.", call. = FALSE)
  }

  first_item <- input$content |> pluck(1)

  if(inherits(first_item, "list")){
    out <- purrr::map_dfr(
      input$content,
      function(x) x %>% purrr::pluck() |> unlist() |> t() |> tibble::as_tibble() |> dplyr::mutate_all(as.character)
    ) |>
      janitor::clean_names()
  } else {
    out <- input$content |>
      unlist() |>
      t() |>
      tibble::as_tibble() |>
      dplyr::mutate_all(as.character) |>
      janitor::clean_names()
  }

  # hard code some variable classes -----------------------------------------

  dt_cols <- out |>
    dplyr::select(dplyr::contains("time"),dplyr::contains("date")) |>
    dplyr::select(-dplyr::contains("all_time")) |>
    colnames()

  num_cols <- c("probability")

  out <-
    out |>
    dplyr::mutate_at(
      dplyr::vars(all_of(dt_cols)),
      function(x) stringr::str_sub(x, 1, 10) |> as.numeric() |> lubridate::as_datetime()
    ) |>
    dplyr::mutate_at(
      dplyr::vars(tidyselect::any_of(num_cols)), as.numeric
    )

  return(out)
}

# usethis::use_test("clean_manifold_content.R")
