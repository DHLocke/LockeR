% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logit.R
\name{logit}
\alias{logit}
\title{inverse logit function}
\usage{
logit(p)
}
\arguments{
\item{p}{proportion to be converted}
}
\value{
the inverse logit
}
\description{
inverse logit function
}
\examples{
look_up_probs <-
  tibble::tibble(probs = seq(0, 1, .01)) |>
  dplyr::mutate(  OR = round((probs / (1 - probs)), 2)
                , `logit(p)` = logit(probs)
                , inv_logit = inv_logit(`logit(p)`)
                , log_OR = log(OR)
                )
look_up_probs |> dplyr::filter(OR == 1)
}
