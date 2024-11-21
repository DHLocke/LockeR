#' get spatial (sf, sp, RasterLayer) objects in memory as character vector, like see_sf but includes sp and RasaterLayer types, too
#'
#' @import sf
#' @return a character vector
#' @export
#'
#' @seealso [see_sf()] is like see_spatial but only returns sf objects, [get_crs()] reports the coordinate reference system, it follows see_sf and see_spatial nicely
#'
#' @examples
#' # These examples only work when copy/pasted into the console since they refer to your environment
#' see_spatial()            # nothing
#' library(spData)          # load a few datasets from the spData package
#' data(alaska)                                                                     # sf data
#' data(house)                                                                      # sp data
#' (elev <- system.file("raster/elev.tif", package = "spData") |> raster::raster()) # RasterLayer data
#' see_spatial()            # returns alaska, house, elev
#' see_sf()                 # character string of sf objects, only alaska here
see_spatial <- function(env = rlang::caller_env()) {
  all_items <- rlang::env_get_list(env, ls(envir = env))
  are_sf <- unlist(lapply(all_items, rlang::inherits_any, c('sf', 'SpatialPoints', 'SpatialPointsLines', 'SpatialPolygons', 'RasterLayer')))
  names(all_items)[are_sf]
}
# see_spatial <-
#   function(){
#     # what's in memory that are sf - spatial features?
#     purrr::keep(eapply(.GlobalEnv, class),
#                 ~ any(stringr::str_detect(., paste(c('sf', 'SpatialPoints', 'SpatialPointsLines', 'SpatialPolygons', 'RasterLayer'), collapse = '|')))) |>
#       names() |>
#       as.character()       # my simple features
#   }
# ## what are the spatial references of those SF classes?
# mget(spatial_in_memory) %>% purrr::map(~crs(.x)) %>% unlist()
