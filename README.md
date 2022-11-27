
<!-- README.md is generated from README.Rmd. Please edit that file -->

# manifoldr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![Codecov test
coverage](https://codecov.io/gh/jcblsn/manifoldr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jcblsn/manifoldr?branch=main)

<!-- badges: end -->

The goal of `manifoldr` is to streamline interactions between R users
and the [Manifold Markets](https://manifold.markets/home) API. The
Manifold Markets API documentation can be found
[here](https://docs.manifold.markets/api). All endpoints are supported
as of November 2022.

<!-- apis in r https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html -->
<!-- secret management https://httr2.r-lib.org/articles/wrapping-apis.html#secret-management -->
<!-- codecov https://github.com/marketplace/actions/codecov -->
<!-- can update locally by running covr::codecov() with token, o/w it'll update when i push to github -->
<!-- testing https://r-pkgs.org/testing-basics.html -->
<!-- create new test with usethis::use_test("get_manifold_api_key.R") -->
<!-- add package to DESCRIPTION (still need to specify @import where relevant for it to be included in NAMESPACE) after roxygen2::roxygenize() devtools::use_package('tibble') -->
<!-- run all tests locally testthat::test_local() -->

## Installation

You can install the development version of `manifoldr` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jcblsn/manifoldr")
```

## Authentication

Some endpoints require authentication. The following instructions are
provided in the API documentation:

> Each account may have zero or one API keys. To generate an API key for
> your account, visit your user profile, click “edit”, and click the
> “refresh” button next to the API key field at the bottom. You can
> click it again any time to invalidate your existing key and generate a
> new one.

Suggested use for this package is to add an API key associated with a
Manifold user account as an environment variable `MANIFOLD_API_KEY` to
`.Rprofile` (using `usethis::edit_r_environ()` or similar). The key can
then be safely retrieved by package functions using
`manifoldr::get_manifold_api_key()` which calls
`Sys.getenv("MANIFOLD_API_KEY")`.

## Examples

Users can reference the core function `manifold_api()` with any endpoint
using the instructions given in the documentation.

``` r
manifoldr::manifold_api(
  endpoint = "/v0/user/ManifoldMarkets", 
  request_type = "GET"
)
```

A number of convenience functions are also provided. These include
functions for specific endpoints and others such as
`clean_manifold_content()`, which will return some output as a data
frame with clean variable names.

``` r
manifoldr::get_markets(n_markets = 3) |> 
  manifoldr::clean_manifold_content()
```

## Code of Conduct

Please note that the `manifoldr` project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
