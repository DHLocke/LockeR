see_spatial <- function(){
  # what's in memory that are sf - spatial features?
  keep(eapply(.GlobalEnv, class), ~ any(str_detect(., paste(c('sf', 'sp', 'RasterLayer'), collapse = '|')))) %>%
    names(.) %>% as.character(.)       # my simple features
}

see_spatial() -> spatial_in_memory

## what are the spatial references of those SF classes?
mget(spatial_in_memory) %>% purrr::map(~crs(.x)) %>% unlist()

