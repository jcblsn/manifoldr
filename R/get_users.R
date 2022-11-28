#' get_users()
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' Retrieve recent users from most to least recent.
#'
#' @param n_users Number of users to retrieve
#' @return Manifold API object
#' @examples
#' get_users(5)
#' @export

get_users <- function(n_users = 100){
  maximum_n_return <- 1000 # per API docs
  if(n_users<=maximum_n_return){
    users <- manifold_api(
      endpoint = "/v0/users",
      request_type = "GET",
      params_list = list("limit" = n_users)
    )
  } else if (n_users > maximum_n_return) {

    retrieved_users <- 0
    users <- manifold_api(
      endpoint = "/v0/users",
      request_type = "GET",
      params_list = list("limit" = 1000)
    )
    users$response <- list(users$response)
    before_id = users$content[[length(users$content)]]$id
    retrieved_users <- retrieved_users+length(users$content)

    while(retrieved_users<n_users) {
      limit_n <- ifelse((n_users-retrieved_users)<=maximum_n_return,
                        n_users-retrieved_users,maximum_n_return)
      out <- manifold_api(
        endpoint = "/v0/users",
        request_type = "GET",
        params_list =
          list("limit" = limit_n, "before" = before_id)
      )
      users$content <- append(users$content, out$content)
      users$response <- append(users$response, list(out$response))
      before_id = out$content[[length(out$content)]]$id
      retrieved_users <- retrieved_users+length(out$content)
    }
  }
  return(users)
}

# usethis::use_test("get_users.R")
