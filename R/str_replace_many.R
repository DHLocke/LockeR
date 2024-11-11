#' str_replace_many, like str_replace_all but accepts many from and to replacements at once
#' thanks Josiah Parry @josiahparry
#' originally posted here https://gist.github.com/JosiahParry/7d953f4af6848e7012566f7abfc63473
#'
#' @description
#' This function does what stringr::str_replace_all does, but allows for multiple replacements at oncer
#'
#' @import rlang
#' @import cli
#' @import stringr
#' @param string the vector or data frame column to apply find/replacements upon
#'
#' @examples
#' str_replace_many("del hello wor!d", "del " = "", "!" = "l")
#'
str_replace_many <- function(string, ...) {
  replacements <- rlang::list2(...)
  patterns <- rlang::names2(replacements)
  if (anyNA(patterns) || any(!nzchar(patterns))) {
    cli::cli_abort("All arguments passed to {.arg ...} must be named")
  }
  for (pattern in replacements) {
    rlang:::check_string(pattern, arg = pattern)
  }

  stringr::str_replace_all(string, unlist(replacements))
}
