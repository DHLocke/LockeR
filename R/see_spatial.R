see_spatial <- function(){
  # what's in memory that are sf - spatial features?
  purrr::keep(eapply(.GlobalEnv, class),
              ~ any(stringr::str_detect(., paste(c('sf', 'sp', 'RasterLayer'), collapse = '|')))) |>
    names() |>
    as.character()       # my simple features
}

see_spatial() -> spatial_in_memory

# ## what are the spatial references of those SF classes?
# mget(spatial_in_memory) %>% purrr::map(~crs(.x)) %>% unlist()

