#' get character vector of INLA objects in memory
#'
#' @return a character vector of INLA objects in memory
#' @export
#' @seealso `inla_plot_fe` for plotting fixed effects and, `inla_table_fe` for extracting tables of fixed effects from INLA objects
#'
#' @examples
#' get_inla()                                   # nothing if you have no INLA objects
#' mtcars <- mtcars |> as.data.frame()          # get data
#' m1 <- INLA::inla(mpg ~ 1   , data = mtcars)  # fit an intercept-only model
#' m2 <- INLA::inla(mpg ~ disp, data = mtcars)  # fit another model
#' get_inla()                                   # character vector of models
#' get_inla() |> mget()                         # list, ripe for map(...)
get_inla <- function(){
  purrr::keep(eapply(.GlobalEnv, class), ~any(stringr::str_detect(., 'inla'))) |>
    names() |>
    as.character()
}
