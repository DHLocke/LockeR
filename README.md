
<!-- README.md is generated from README.Rmd. Please edit that file -->

# LockeR <img src="man/figures/logo.png" align="right"/>

<!-- badges: start -->
<!-- badges: end -->

LockeR is a safe place to keep miscellaneous functions for reuse.

The purpose of this package is to bundle potentially useful homemade
functions currently scattered across the author’s local hard drive in
unrelated projects into well-documented code for reuse by others. This
is also an opportunity to build package development skills. This package
is a work in progress, feedback is welcomed and encouraged!

## Installation

You can install the development version of LockeR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DHLocke/LockeR")
```

## Dependencies

This package relies heavily on:

- The [`tidyverse`](http://tidyverse.org/) packages, namely `dplyr`,
  `tidyr`, `purrr`, `stringr`, `tibble`, and `ggplot2`
- TODO something about SF-functions.
- TODO something about INLA support

## Families of functions

right now there are tk groups of interrelated functions, in no
particular order

- **spatial support:** functions including
  [see_sf()](https://github.com/DHLocke/LockeR/blob/main/R/see_sf.R) and
  [see_spatial()](https://github.com/DHLocke/LockeR/blob/main/R/see_spatial.R)
  identify sf, and sf, sp, and/or RasterLayer objects in memory,
  respectively

- **INLA support:** functions including
  [get_inla()](https://github.com/DHLocke/LockeR/blob/main/R/get_inla.R),
  [inla_plot_fe()](https://github.com/DHLocke/LockeR/blob/main/R/inla_plot_fe.R),
  and
  [inla_table_fe()](https://github.com/DHLocke/LockeR/blob/main/R/inla_table_fe.R)
  for accessing and prying information out of objects created by the
  [`INLA`](https://www.r-inla.org/) package. INLA (Integrated Nested
  Laplace Approximation) is an method for approximate Bayesian
  inference. It uses calculus instead of Markov Chain Monte Carlo
  methods. The resultant model objects are densely-packed list objects,
  and these functions make handling and extracting summaries more
  user-friendly.

- **temperature conversions:** functions including
  [to_cel()](https://github.com/DHLocke/LockeR/blob/main/R/to_cel.R),
  [to_farh()](https://github.com/DHLocke/LockeR/blob/main/R/to_farh.R),
  which convert from degrees Fahrenheit to degrees Celsius, and degrees
  Celsius to degrees Fahrenheit, respectively

- **potpourri (strange since the package is *already* a bag of
  miscellany):**

  - [logit()](https://github.com/DHLocke/LockeR/blob/main/R/to_cel.R)
    and
    [inv_logit()](https://github.com/DHLocke/LockeR/blob/main/R/to_cel.R)
    which takes logit and the inverse logit of proportions, copied from
    the boot package.

  - [nin](https://github.com/DHLocke/LockeR/blob/main/R/nin.R) which is
    a ‘not in’ opperator, the complement to %in%, and like
    dplyr::anti_join but for vectors instead of data frame columns. This
    is affectionately also known as the [Trent
    Rezonr](https://en.wikipedia.org/wiki/Trent_Reznor) function, in
    honor of the front man of the industrial rock band Nine Inch Nails,
    often abreviated as “NIИ”

  - [phone_it_in](https://github.com/DHLocke/LockeR/blob/main/R/phone_it_in.R)
    which standardizes 7 and 10 digitphone numbers with regular
    expressions, pulled from a
    [stackoverflow](https://stackoverflow.com/questions/34616466/formatting-phone-numbers-in-r)
    answer by
    [Benjamin](https://stackoverflow.com/users/1017276/benjamin)
