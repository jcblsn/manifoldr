# Sat Nov 26 23:42:51 2022 ------------------------------

# per ?usethis::use_r

# This script generates a data frame of ⁠R/⁠ and test files that can help you identify missed opportunities for pairing:

# bind_rows(
#   tibble(
#     type = "R",
#     path = fs::dir_ls("R/", regexp = "\\.[Rr]$"),
#     name = as.character(fs::path_ext_remove(fs::path_file(path))),
#   ),
#   tibble(
#     type = "test",
#     path = fs::dir_ls("tests/testthat/", regexp = "/test[^/]+\\.[Rr]$"),
#     name = as.character(fs::path_ext_remove(stringr::str_remove(fs::path_file(path), "^test[-_]"))),
#   )
# ) |>
#   pivot_wider(names_from = type, values_from = path) |>
#   print(n = Inf)
