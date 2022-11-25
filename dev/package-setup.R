
# Fri Nov 25 12:52:50 2022 ------------------------------

# acknowledgments:
# https://colinfay.me/build-api-wrapper-package-r/

library(devtools)
library(usethis)
library(desc)

# remove default DESC
# unlink("DESCRIPTION")
my_desc <- description$new("!new")

my_desc$set("Package", "manifoldr")
my_desc$set("Authors@R", "person('Jacob', 'Eliason', email = 'jacobeliason@gmail.com', role = c('cre', 'aut'))")
my_desc$del("Maintainer")
my_desc$set_version("0.0.0")
my_desc$set(Title = "Manifold Markets API Wrapper")
my_desc$set(Description = 'The R package `manifoldr` is an API wrapper for the prediction market platform "Manifold Markets." It allows R users to more easily access the Manifold Markets API to create markets, place bets on existing markets, and more.')
usethis::use_github_links(overwrite = T)
my_desc$write(file = "DESCRIPTION")

use_package("httr")
use_package("jsonlite")
use_package("curl")

# use_news_md()
# use_readme_rmd()
use_mit_license()
use_code_of_conduct(contact = "jacobeliason@gmail.com")
use_lifecycle_badge("Experimental")
