#' get character vector of INLA objects in memory
#'
#' @return a character vector of INLA objects in memory
#' @export
#' @seealso \code{\link{inla_plot_fe}}, \code{\link{inla_table_fe}}
#'
#' @examples
#' get_inla()                             # nothing
#' mtcars <- mtcars |> as.data.frame() # get data
#' m1 <- inla(mpg ~ 1   , data = mtcars)  # fit an intercept-only model
#' m2 <- inla(mpg ~ disp, data = mtcars)  # fit another model
#' get_inla()                             # character vector of models
#' get_inla() |> mget()                   # list, ripe for map(...)
get_inla <- function(){
  purrr::keep(eapply(.GlobalEnv, class), ~any(stringr::str_detect(., 'inla'))) |>
    names() |>
    as.character()
}
