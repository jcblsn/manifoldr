
<!-- README.md is generated from README.Rmd. Please edit that file -->

# manifoldr

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![Codecov test
coverage](https://codecov.io/gh/jcblsn/manifoldr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jcblsn/manifoldr?branch=main)

<!-- badges: end -->

The goal of `manifoldr` is to streamline interactions between R users
and the [Manifold Markets](https://manifold.markets/home) API. The
Manifold Markets API documentation can be found
[here](https://docs.manifold.markets/api#post-v0marketmarketidresolve).
All endpoints are supported as of November 2022.

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

## Examples

Users can reference the core function `manifold_api()` with any endpoint
using the instructions given in the documentation.

``` r
resp <- manifoldr::manifold_api(
  endpoint = "/v0/user/ManifoldMarkets", 
  request_type = "GET"
)
resp$content
#> $id
#> [1] "IPTOzEqrpkWmEzh6hwvAyY9PqFb2"
#> 
#> $createdTime
#> [1] 1.639534e+12
#> 
#> $name
#> [1] "Manifold Markets"
#> 
#> $username
#> [1] "ManifoldMarkets"
#> 
#> $url
#> [1] "https://manifold.markets/ManifoldMarkets"
#> 
#> $avatarUrl
#> [1] "https://firebasestorage.googleapis.com/v0/b/mantic-markets.appspot.com/o/user-images%2FManifoldMarkets%2F97s_Lcavdy.png?alt=media&token=7ac882d7-6626-4934-95c9-cd9df8f7e205"
#> 
#> $bio
#> [1] "The OFFICIAL Manifold Markets account!\nWe sometimes make important markets here, but right now it mostly acts as a bank for manalinks and other payments."
#> 
#> $website
#> [1] "https://manifold.markets"
#> 
#> $twitterHandle
#> [1] "ManifoldMarkets"
#> 
#> $discordHandle
#> [1] "https://discord.gg/VARzUpyCSa"
#> 
#> $balance
#> [1] 5259765
#> 
#> $totalDeposits
#> [1] 5261328
#> 
#> $profitCached
#> $profitCached$weekly
#> [1] 32.32816
#> 
#> $profitCached$monthly
#> [1] 15263.39
#> 
#> $profitCached$allTime
#> [1] -4195.25
#> 
#> $profitCached$daily
#> [1] -63.0986
```

A number of convenience functions are also provided, including
`clean_manifold_content()`, which returns output as a data frame with
clean variable names.

``` r
manifoldr::get_markets(n_markets = 3) |> 
  manifoldr::clean_manifold_content() |> 
  knitr::kable()
```

## Code of Conduct

Please note that the `manifoldr` project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
