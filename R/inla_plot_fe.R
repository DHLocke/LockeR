#' Plot fixed effects from model fit with INLA::inla
#'
#' @param inla_model
#'
#' @return a ggplot graph (or table with `inla_table_fe`) of fixed effects derived from a model fit with INLA::inla()
#' @export
#'
#' @seealso \code{\link{get_inla}}, \code{\link{inla_table_fe}}
#'
#' @examples
#' mtcars <- mtcars |> as.data.frame() # get data
#' m1 <- inla(mpg ~ 1   , data = mtcars) # fit an intercept-only model
#' m2 <- inla(mpg ~ disp, data = mtcars) # fit another model
#' inla_plot_fe(m1) # fixed effects, m1
#' inla_table_fe(m1)
#' inla_plot_fe(m2) # fixed effects, m2
#' inla_table_fe(m2)
#'
#' # great when used in conjunction with `get_inla()`
#' LockeR::get_inla() |> mget() |> purrr::map(inla_table_fe) # extract fixed effects from INLA models in memory
#' get_inla() |> mget() |> purrr::map_dfr(inla_table_fe, .id = 'model') # bind together for custom graphing or export
#' get_inla() |> mget() |> purrr::map(inla_plot_fe) # graph multiple models' fixed effects
inla_plot_fe <- function(inla_model){
  inla_model |>
    purrr::pluck('summary.fixed') |>
    tibble::rownames_to_column(var = 'predictor') |>
    ggplot2::ggplot(ggplot2::aes(`0.5quant`, predictor)) +
    ggplot2::geom_vline(xintercept = 0) +
    ggplot2::geom_point() +
    ggplot2::geom_errorbarh(ggplot2::aes(xmin = `0.025quant`, xmax = `0.975quant`, height = .5)) +
    ggplot2::theme_bw() +
    NULL
}

#' @seealso \code{\link{inla_plot_fe}}
#'
inla_table_fe <-
  function(inla_model){
    inla_model |>
      purrr::pluck('summary.fixed') |>
      tibble::rownames_to_column(var = 'Predictors') |>
      dplyr::select(Predictors, median = `0.5quant`, lower = `0.025quant`, upper = `0.975quant`) |>
      dplyr::mutate(dplyr::across(c(-Predictors), round, 3))
  }
