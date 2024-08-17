# # see which objects are of type sf
# # thanks Kelly Hondula
# # https://scholar.google.com/citations?user=Xdhvu9QAAAAJ&hl=en
#' get sf object in memory as a character string
#'
#' @import sf
#' @import sfdep
#' @return a character vector
#' @export
#'
#' @examples
#' see_sf()                 # nothing
#' library(sfdep)
#' test_sf_object <- guerry # a built in dataset in the sfdep package
#' see_sf()                 # character string of sf objects
#' see_spatial()            # also finds objects of class sp, sf, or RasterLayer
#' # TODO link to get_crs
see_sf <-
  function(){
    # what's in memory that are sf - simple features?
    purrr::keep(eapply(.GlobalEnv, base::class),        # gets the objects in the global environment
                ~ any(stringr::str_detect(., "sf"))) |> # selects elements with sf in them
      names() |>
      as.character()       # my simple features, as a character vector
  }

see_spatial <- function(){
  # what's in memory that are sf - spatial features?
  purrr::keep(eapply(.GlobalEnv, class),
              ~ any(stringr::str_detect(., paste(c('sf', 'sp', 'RasterLayer'), collapse = '|')))) |>
    names() |>
    as.character()       # my simple features
}

# ## what are the spatial references of those SF classes?
# mget(spatial_in_memory) %>% purrr::map(~crs(.x)) %>% unlist()
