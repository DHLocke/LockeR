#' Plot fixed effects from model fit with INLA::inla
#'
#' @param inla_model
#'
#' @return a ggplot graph (or table with "inla_table_fe") of fixed effects derived from a model fit with INLA::inla()
#' @export
#'
#' @examples
#' mtcars <- mtcars |> as.data.frame()
#' m1 <- inla(mpg ~ 1   , data = mtcars)
#' m2 <- inla(mpg ~ disp, data = mtcars)
#' inla_plot_fe(m1)
#' inla_plot_fe(m2)
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

inla_table_fe <-
  function(inla_model){
    inla_model |>
      purrr::pluck('summary.fixed') |>
      tibble::rownames_to_column(var = 'Predictors') |>
      dplyr::select(Predictors, median = `0.5quant`, lower = `0.025quant`, upper = `0.975quant`) |>
      dplyr::mutate(across(c(-Predictors), round, 3))
  }
