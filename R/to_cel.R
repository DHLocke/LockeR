#' Title convert Fahrenheit to Celsius
#'
#' @param fahr
#'
#' @return the degrees Celsius
#' @export
#'
#' @examples
#' to_cel(32)   # 0  works!
#' to_cel(212)  # 100 works!
#' to_cel(-40)  # -40, success!

to_cel <- function(fahr){
  cel = (fahr - 32) * (5/9)
  return(cel)
}
