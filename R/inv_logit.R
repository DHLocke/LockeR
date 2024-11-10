#' inverse logit function
#'
#' @param x the number or vector to be converted
#' @return the inverse logit
#' @export
#'
#' @examples
#'look_up_probs <-
#'   tibble::tibble(probs = seq(0, 1, .01)) |>
#'   dplyr::mutate(  OR = round((probs / (1 - probs)), 2)
#'                 , `logit(p)` = logit(probs)
#'                 , inv_logit = inv_logit(`logit(p)`)
#'                 , log_OR = log(OR)
#'                 )
#' look_up_probs |> dplyr::filter(OR == 1)
inv_logit <- function(x){
  # Calculate the inverse logit of number
  # copied directly from boot
  # https://rdrr.io/cran/boot/src/R/bootfuns.q
  out <- exp(x)/(1+exp(x))
  out[x==-Inf] <- 0
  out[x==Inf] <- 1
  out
  }
