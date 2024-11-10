#' inverse logit function
#'
#' @param p proportion to be converted
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
logit <- function(p){
  qlogis(p)
  # Calculate the logit of a proportion in the range [0,1]
  # copied from boot
  # https://rdrr.io/cran/boot/src/R/bootfuns.q
  out <- p
  inds <- seq_along(p)[!is.na(p)]
    if (any((p[inds] < 0) | (p[inds] > 1)))
      stop("invalid proportions input")
  out[inds] <- log(p[inds]/(1-p[inds]))
  out[inds][p[inds] == 0] <- -Inf
  out[inds][p[inds] == 1] <- Inf
  out
  }
