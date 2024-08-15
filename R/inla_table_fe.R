#' Make table of fixed effects from model fit with INLA::inla
#'
#' @param inla_model
#'
#' @return a table of fixed effects estimated from a model fit with INLA::inla()
#' @export
#'
#' @examples
#' mtcars <- mtcars |> as.data.frame()
#' m1 <- inla(mpg ~ 1   , data = mtcars)
#' m2 <- inla(mpg ~ disp, data = mtcars)
#' inla_table_fe(m1)
#' inla_table_fe(m2)
#' get_inla() |> map(inla_table_fe)
inla_table_fe <-
  function(inla_model){
    inla_model |>
      purrr::pluck('summary.fixed') |>
      tibble::rownames_to_column(var = 'Predictors') |>
      dplyr::select(Predictors, median = `0.5quant`, lower = `0.025quant`, upper = `0.975quant`) |>
      dplyr::mutate(across(c(-Predictors), round, 3))
    }
