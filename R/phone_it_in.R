# clean up phone numbers
# https://stackoverflow.com/questions/34616466/formatting-phone-numbers-in-r
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


phone <- c("(123)-456-7890", "1234567890", "456890", "456-7890")
phone_it_in(phone)
