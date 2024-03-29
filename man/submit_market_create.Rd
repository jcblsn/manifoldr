% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/submit_market_create.R
\name{submit_market_create}
\alias{submit_market_create}
\title{submit_market_create}
\usage{
submit_market_create(
  mm_key = get_manifold_api_key(),
  mm_outcome_type = c("BINARY", "FREE_RESPONSE", "MULTIPLE_CHOICE", "PSEUDO_NUMERIC"),
  mm_question,
  mm_description_md,
  mm_close_time,
  mm_visibility = c("public", "unlisted"),
  mm_group_id,
  mm_initial_prob,
  mm_min,
  mm_max,
  mm_is_log_scale,
  mm_initial_value,
  mm_answers
)
}
\arguments{
\item{mm_key}{A Manifold Markets API key for authentication}

\item{mm_outcome_type}{Required. One of \code{BINARY}, \code{FREE_RESPONSE}, \code{MULTIPLE_CHOICE}, or \code{PSEUDO_NUMERIC}}

\item{mm_question}{Required. The headline question for the market.}

\item{mm_description_md}{Optional. A long description describing the rules for the market. Supports markdown notation for rich text formatting.}

\item{mm_close_time}{Optional. The time at which the market will close, represented as milliseconds since the epoch. Defaults to 7 days from now.}

\item{mm_visibility}{Optional. One of \code{public} (default) or \code{unlisted}. Controls whether the market is shown on the homepage.}

\item{mm_group_id}{Optional. A group to create this market under.}

\item{mm_initial_prob}{Required for binary markets. An initial probability for the market, between 1 and 99.}

\item{mm_min}{Required for numeric markets. The minimum value that the market may resolve to.}

\item{mm_max}{Required for numeric markets. The maximum value that the market may resolve to.}

\item{mm_is_log_scale}{Required for numeric markets. If true, your numeric market will increase exponentially from min to max.}

\item{mm_initial_value}{Required for numeric markets. An initial value for the market, between min and max, exclusive.}

\item{mm_answers}{Required for multiple choice markets. An array of strings, each of which will be a valid answer for the market.}
}
\value{
Manifold API object
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

Create a new market
}
