
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
#' library(sf)
#' library(spData) # package of spatial data, see also 'spDataLarge'
#' data(alaska)
#' data(nz)
#' data(urban_agglomerations)
#' (sf_in_memory <- see_sf())
#' get_crs(sf_in_memory)
#' sf_in_memory |> get_crs()
get_crs <-
  function(sf_in_memory) {
    sf_in_memory |>
      mget() |>
      purrr::map_df(~sf::st_crs(.x, parameters = TRUE)$Wkt) |>
      tibble::rowid_to_column() |>
      tidyr::pivot_longer(-rowid, names_to = 'sf_dataset', values_to = 'Wkt') |>
      dplyr::select(-rowid)
  }
