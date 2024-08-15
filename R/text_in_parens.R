# get text from within parentheses
# from: https://community.rstudio.com/t/extract-text-between-brakets/43448/6
fake_variable <- ' Country name is (FR)'
modified_fake_variable <- stringr::str_extract(string = fake_variable,
                                               pattern = "(?<=\\().*(?=\\))")
modified_fake_variable
