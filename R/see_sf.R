# # see which objects are of type sf
# # thanks Kelly Hondula
# # https://scholar.google.com/citations?user=Xdhvu9QAAAAJ&hl=en
see_sf <- function(){
  # what's in memory that are sf - spatial features?
  purrr::keep(eapply(.GlobalEnv, class),              # gets the objects in the global environment
              ~ any(stringr::str_detect(., "sf"))) |> # selects elements with sf in them
    names() |>
    as.character()       # my simple features, as a character vector
}

# see_sf() -> sf_in_memory



## what are the spatial references of those SF classes?
# get the coordinate reference system (CRS) of spatial
# call this get_crs?
# mget(sf_in_memory) %>% purrr::map(~st_crs(.x)$epsg) %>% unlist()
