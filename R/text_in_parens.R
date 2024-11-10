# extract text from within parentheses
# from: https://community.rstudio.com/t/extract-text-between-brakets/43448/6
#' extract text from within parentheses
#'
#' @description
#' this finds and extracts the string between "(" and ")".
#'
#' @return the text between two parentheses
#' @export
#'
#' @examples
#' # extract text from within parentheses
#' # based on
#' # https://community.rstudio.com/t/extract-text-between-brakets/43448/6
#' (letters_df <- data.frame(LETTERS, with_parens = paste0('(', LETTERS, ')')))
#' letters_df |> dplyr::mutate(full_circle = text_in_parens(with_parens))
text_in_parens <-
  function(string_w_parens){
    stringr::str_extract(string = string_w_parens
                         , pattern = "(?<=\\().*(?=\\))")
    }
