#' clean up US phone numbers
#'
#' @description
#' Standardize 7 and 10 digit numbers to have consistent formatting without parentheses, with dashes between the 3rd and 4th digits and between the 6th and 7th digits when an area code is provided. Numbers not 7 or 10 digits in length are assigned NA by default, but can be assigned a chosen value with the "invalid" argument.
#'
#' @return phone numbers in a ###-#### or ###-###-#### format
#' @export
#'
#' @examples
#' # clean up US phone numbers
#' # based on
#' # https://stackoverflow.com/questions/34616466/formatting-phone-numbers-in-r
#' phone <- c("(123)-456-7890", "1234567890", "456890", "456-7890")
#' phone_it_in(phone)
#' phone_it_in(phone, invalid = 'Not a phone number')
phone_it_in <- function(phone, invalid = NA)
{
  phone <- gsub("[[:punct:]]", "", phone)          # remove punctuation
  phone <- trimws(phone)                           # remove whitespace
  phone[!nchar(phone) %in% c(7, 10)] <- invalid    # keep only 7 or 10 digit numbers
  phone[nchar(phone) %in% 7] <- gsub("(^\\d{3})(\\d{4}$)",
                                     "\\1-\\2",
                                     phone[nchar(phone) %in% 7])
  phone[nchar(phone) %in% 10] <- gsub("(^\\d{3})(\\d{3})(\\d{4}$)",
                                      "\\1-\\2-\\3", # no parentheses, see fn below
                                      phone[nchar(phone) %in% 10])
  phone
}
