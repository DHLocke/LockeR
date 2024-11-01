#' function for "Not In", the complement of %in%, like dplyr::anti_join but for vectors instead of data frame columns
#'
#' @return a filtered vector
#' @export
#'
#' @examples
#' vowels <- c('A', 'E', 'I', 'O', 'U')
#' (consonants <- LETTERS %nin% vowels)
#'
#' warpbreaks # has tension values of L, M, and H
#' tension_to_drop <- c('L', 'M')
#' warpbreaks |> dplyr::filter(tension %nin% tension_to_drop)
`%nin%` <- Negate(`%in%`)
