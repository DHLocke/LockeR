#' get character vector of INLA objects in memory
#'
#' @return a character vector of INLA objects in memory
#' @export
#'
#' @examples
#' get_inla()
#' get_inla() |> mget()
#' test_inla_model <- inla(rnorm)
get_inla <- function(){
  purrr::keep(eapply(.GlobalEnv, class), ~any(str_detect(., 'inla'))) |>
    names() |>
    as.character()
}


