#' Plot fixed effects from model fit with INLA::inla
#'
#' @param inla_model a model fit with INLA::inla()
#'
#' @return a tibble of fixed effects derived from a model fit with INLA::inla(). Columns include the predictor variable (Predictors), median posterior estimate (median), and 95% Credible Interval, the Bayesian analog to 95% Confidence Intervals denoted with "lower" and "upper".
#' @export
#'
#' @seealso [get_inla()] for identifying INLA model objects in memory and [inla_plot_fe()] ggplot graphs of fixed effects from INLA objects
#' @examples
#' mtcars <- mtcars |> as.data.frame()         # get data
#' m1 <- INLA::inla(mpg ~ 1   , data = mtcars) # fit an intercept-only model
#' m2 <- INLA::inla(mpg ~ disp, data = mtcars) # fit another model
#' inla_table_fe(m1)
#' inla_table_fe(m2)
#'
#' # great when used in conjunction with `get_inla()`
#' # extract fixed effects from INLA models in memory
#' LockeR::get_inla() |> mget() |> purrr::map(inla_table_fe)
#'
#' # bind together for custom graphing or export
#' get_inla() |> mget() |> purrr::map_dfr(inla_table_fe, .id = 'model')
#'
#' # graph multiple models' fixed effects
#' get_inla() |> mget() |> purrr::map(inla_plot_fe)
#' @seealso `inla_plot_fe`
#'
inla_table_fe <-
  function(inla_model){
    inla_model |>
      purrr::pluck('summary.fixed') |>
      tibble::rownames_to_column(var = 'Predictors') |>
      dplyr::select(Predictors, median = `0.5quant`, lower = `0.025quant`, upper = `0.975quant`) |>
      dplyr::mutate(dplyr::across(c(-Predictors), round, 3))
  }
