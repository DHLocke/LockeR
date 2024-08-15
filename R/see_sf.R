# # see which objects are of type sf
# # thanks Kelly Hondula
# # https://scholar.google.com/citations?user=Xdhvu9QAAAAJ&hl=en
#' get the sf object in memory as a character string
#'
#' @import sf
#' @import sfdep
#' @return a character vector
#' @export
#'
#' @examples
#' see_sf()
#' library(sfdep)
#' test_sf_object <- guerry # a built in dataset in the sfdep package
#' see_sf()
see_sf <-
  function(){
    # what's in memory that are sf - simple features?
    purrr::keep(eapply(.GlobalEnv, base::class),        # gets the objects in the global environment
                ~ any(stringr::str_detect(., "sf"))) |> # selects elements with sf in them
      names() |>
      as.character()       # my simple features, as a character vector
    }

see_sf()

# see_sf() -> sf_in_memory



## what are the spatial references of those SF classes?
# get the coordinate reference system (CRS) of spatial
# call this get_crs?
# mget(sf_in_memory) %>% purrr::map(~st_crs(.x)$epsg) %>% unlist()
