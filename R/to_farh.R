#' Title convert Celsius to Fahrenheit
#'
#'
#' @return the degrees Fahrenheit
#' @export
#'
#' @examples
#' to_fahr(0)   # 32  works!
#' to_fahr(100) # 212 works!
#' to_fahr(-40)  # -40, success!

to_fahr = function(celsius) {
  f = (9/5) * celsius + 32
  return(f)
}
