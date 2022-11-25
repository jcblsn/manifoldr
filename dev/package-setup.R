
# Fri Nov 25 12:52:50 2022 ------------------------------

# acknowledgments:
# https://colinfay.me/build-api-wrapper-package-r/

library(devtools)
library(usethis)
library(desc)

# Remove default DESC
unlink("DESCRIPTION")
# Create and clean desc
my_desc <- description$new("!new")

# Set your package name
my_desc$set("ManifoldR", "manifoldr")

#Set your name
my_desc$set("Authors@R", "person('Jacob', 'Eliason', email = 'jacobeliason@gmail.com', role = c('cre', 'aut'))")

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.0.0")

# The title of your package
my_desc$set(Title = "Manifold Markets API Wrapper")
# The description of your package
my_desc$set(Description = 'The R package `manifoldr` is an API wrapper for the prediction market platform "Manifold Markets." It allows R users to more easily access the Manifold Markets API to create markets, place bets on existing markets, and more.')
# The urls
my_desc$set("URL", "https://github.com/eliason-j/manifoldr")
my_desc$set("BugReports", "https://github.com/eliason-j/manifoldr/issues")
# Save everyting
my_desc$write(file = "DESCRIPTION")

# If you want to use the MIT licence, code of conduct, and lifecycle badge
use_mit_license()
usethis::use_readme_rmd()
use_code_of_conduct(contact = "jacobeliason@gmail.com")
use_lifecycle_badge("Experimental")
use_news_md()

# Get the dependencies
use_package("httr")
use_package("jsonlite")
use_package("curl")

# Clean your description
use_tidy_description()
