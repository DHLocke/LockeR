#' get spatial (sf, sp, RasterLayer) objects in memory as character vector
#'
#' @import sf
#' @return a character vector
#' @export
#'
#' @seealso [see_sf()]
#'
#' @examples
#' # These examples only work when copy/pasted into the console since they refer to your environment
#' see_spatial()            # nothing
#' see_sf()                 # nothing
#' library(sf)
#' test_sf_object <- nz     # a built in dataset in the sf package
#' see_spatial()            # character string of sf objects
#' see_spatial()            # also finds objects of class sp, sf, or RasterLayer
#' # TODO link to get_crs
see_spatial <-
  function(){
    # what's in memory that are sf - spatial features?
    purrr::keep(eapply(.GlobalEnv, class),
                ~ any(stringr::str_detect(., paste(c('sf', 'sp', 'RasterLayer'), collapse = '|')))) |>
      names() |>
      as.character()       # my simple features
  }
# ## what are the spatial references of those SF classes?
# mget(spatial_in_memory) %>% purrr::map(~crs(.x)) %>% unlist()
