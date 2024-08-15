
## what are the spatial references of those sf classes?
#
# call this get_crs?
# mget(sf_in_memory) %>% purrr::map(~st_crs(.x)$epsg) %>% unlist()
#' get the coordinate reference system (CRS) for simple feature object
#'
#' @param sf_in_memory
#'
#' @return tibble of sf object names (sf) and their Wkt project information (WKt)
#' @export
#'
#' @examples
#' library(sfdep)
#' test_sf_object <- guerry # a built in dataset in the sfdep package
#' library(sf)
#' demo(nc, ask = FALSE, echo = FALSE)
#' see_sf() # should be test_sf_object and nc
#' sf_in_memory <- see_sf()
#' get_crs(sf_in_memory)
#' sf_in_memory |> get_crs()
get_crs <-
  function(sf_in_memory) {
    sf_in_memory |>
      mget() |>
      purrr::map_df(~sf::st_crs(.x, parameters = TRUE)$Wkt) |>
      tibble::rowid_to_column() |>
      tidyr::pivot_longer(-rowid, names_to = 'sf', values_to = 'Wkt') |>
      dplyr::select(-rowid)
  }
