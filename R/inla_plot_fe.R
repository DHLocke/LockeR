#' Plot fixed effects from model fit with INLA::inla
#'
#' @param inla_model a model fit with INLA::inla()
#'
#' @return a ggplot graph of fixed effects derived from a model fit with INLA::inla()
#' @export
#'
#' @seealso `get_inla()` for identifying INLA model objects in memory and `inla_table_fe()` for extracting tables of fixed effects from INLA objects
#' @examples
#' mtcars <- mtcars |> as.data.frame() # get data
#' m1 <- INLA::inla(mpg ~ 1   , data = mtcars) # fit an intercept-only model
#' m2 <- INLA::inla(mpg ~ disp, data = mtcars) # fit another model
#' inla_plot_fe(m1) # fixed effects, m1
#' inla_plot_fe(m2) # fixed effects, m2
#'
#' # great when used in conjunction with `get_inla()`
#' # extract fixed effects from INLA models in memory
#' LockeR::get_inla() |> mget() |> purrr::map(inla_plot_fe)
#'
#' # bind together for custom graphing or export
#' get_inla() |> mget() |> purrr::map_dfr(inla_table_fe, .id = 'model')
#'
#' # graph multiple models' fixed effects
#' get_inla() |> mget() |> purrr::map(inla_plot_fe)
inla_plot_fe <- function(inla_model){
  inla_model |>
    purrr::pluck('summary.fixed') |>
    tibble::rownames_to_column(var = 'predictor') |>
    ggplot2::ggplot(ggplot2::aes(.data[["0.5quant"]], .data[["predictor"]])) +
    ggplot2::geom_vline(xintercept = 0) +
    ggplot2::geom_point() +
    ggplot2::geom_errorbarh(ggplot2::aes(xmin = `0.025quant`, xmax = `0.975quant`, height = .5)) +
    ggplot2::theme_bw() +
    NULL
}
