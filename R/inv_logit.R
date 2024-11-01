#' inverse logit function
#'
#' @import gtools
#' @return the inverse logit
#' @export
#'
#' @examples
#'look_up_probs <-
#'   tibble::tibble(probs = seq(0, 1, .01)) |>
#'   dplyr::mutate(  OR = round((probs / (1 - probs)), 2)
#'                 , `logit(p)` = gtools::logit(probs)
#'                 , inv_logit = inv_logit(`logit(p)`)
#'                 , log_OR = log(OR)
#'                 )
#' look_up_probs |> filter(OR == 1)
inv_logit <- function(p) exp(p) / (1 + exp(p))
