
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
  `purrr`, `stringr`, `tibble`, and `ggplot2`
- The [`sf`](https://github.com/r-spatial/sf) for spatial data handling
  and [`spData`](https://jakubnowosad.com/spData/) packages spatial data
  in examples
- There are functions for graphing and extracting tables from model
  objects created by the [`INLA`](https://www.r-inla.org/) package.
- The
  [`parallel`](https://stat.ethz.ch/R-manual/R-devel/library/parallel/doc/parallel.pdf)
  is used for the st_parallel function which takes any
  [`sf`](https://github.com/r-spatial/sf) function and parallelizes
  them, to process large jobs faster over multiple cores.

## Families of functions

right now there are four main groups of interrelated functions, in no
particular order

1.  **spatial support:** functions including
    [see_sf()](https://github.com/DHLocke/LockeR/blob/main/R/see_sf.R)
    and
    [see_spatial()](https://github.com/DHLocke/LockeR/blob/main/R/see_spatial.R)
    identify sf, and sf, sp, and/or RasterLayer objects in memory,
    respectively. The
    [st_parallel()](https://github.com/DHLocke/LockeR/blob/main/R/st_parallel.R)
    parallizes any st\_\* function in the sf package to take advantage
    of mutli-core processing for large jobs. This is especially useful
    for overlay operations like st_intersection.

    - TODO expand to other object types

    - TODO fix get_crs to actually work!

2.  **INLA support:** functions including
    [get_inla()](https://github.com/DHLocke/LockeR/blob/main/R/get_inla.R),
    [inla_plot_fe()](https://github.com/DHLocke/LockeR/blob/main/R/inla_plot_fe.R),
    and
    [inla_table_fe()](https://github.com/DHLocke/LockeR/blob/main/R/inla_table_fe.R)
    for accessing and prying information out of objects created by the
    [`INLA`](https://www.r-inla.org/) package. INLA (Integrated Nested
    Laplace Approximation) is an method for approximate Bayesian
    inference. It uses calculus instead of Markov Chain Monte Carlo
    methods. The resultant model objects are densely-packed list
    objects, and these functions make handling and extracting summaries
    more user-friendly.

3.  **temperature conversions:** functions including
    [to_cel()](https://github.com/DHLocke/LockeR/blob/main/R/to_cel.R),
    [to_farh()](https://github.com/DHLocke/LockeR/blob/main/R/to_farh.R),
    which convert from degrees Fahrenheit to degrees Celsius, and
    degrees Celsius to degrees Fahrenheit, respectively.

4.  **Regular Expressions (regex) in action**

    - [phone_it_in](https://github.com/DHLocke/LockeR/blob/main/R/phone_it_in.R)
      which standardizes 7 and 10 digit phone numbers with regular
      expressions, pulled from a
      [stackoverflow](https://stackoverflow.com/questions/34616466/formatting-phone-numbers-in-r)
      answer by
      [Benjamin](https://stackoverflow.com/users/1017276/benjamin).

    - [text_in_parens](https://github.com/DHLocke/LockeR/blob/main/R/text_it_parens.R)
      which extracts text from within parentheses, which is surprisingly
      difficult! Taken from [this
      post](https://community.rstudio.com/t/extract-text-between-brakets/43448/6).

5.  **potpourri (strange since the package is *already* a bag of
    miscellany):**

    - [set_up_dirs()](https://github.com/DHLocke/LockeR/blob/main/R/set_up_dirs.R)
      makes commonly-used folders to expedite project set up, and create
      standardization across projects. This makes it easier to re-use
      snippets of code from other projects to save out tables and
      figures.

    - [logit()](https://github.com/DHLocke/LockeR/blob/main/R/to_cel.R)
      and
      [inv_logit()](https://github.com/DHLocke/LockeR/blob/main/R/to_cel.R)
      which takes logit and the inverse logit of proportions, copied
      from the boot package.

    - [nin](https://github.com/DHLocke/LockeR/blob/main/R/nin.R) which
      is a ‘not in’ opperator, the complement to %in%, and like
      dplyr::anti_join but for vectors instead of data frame columns.
      This is affectionately also known as the [Trent
      Rezonr](https://en.wikipedia.org/wiki/Trent_Reznor) function, in
      honor of the front man of the industrial rock band Nine Inch
      Nails, often abbreviated as “NIИ”.
