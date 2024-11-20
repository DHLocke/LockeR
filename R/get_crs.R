#' get the coordinate reference system (CRS) for simple feature objects in memory
#'
#' @return tibble of sf object names (sf) and their epsg and Wkt projection information (WKt)
#' @export
#' @import spData
#'
#' @examples
#' library(sf)
#' library(spData) # package of spatial data, see also 'spDataLarge'
#' data(alaska)
#' data(nz)
#' data(urban_agglomerations)
#' see_sf()
#' get_crs()
get_crs <- function() {
  see_sf() |>
    mget(envir = .GlobalEnv) |>
    purrr::map_df(~sf::st_crs(.x, parameters = TRUE)$epsg) |>
    tibble::rowid_to_column() |>
    tidyr::pivot_longer(-rowid, names_to = 'sf_dataset', values_to = 'epsg') |>
    dplyr::select(-rowid) |>
    dplyr::left_join(
      see_sf() |>
        mget(envir = .GlobalEnv) |>
        purrr::map_df(~sf::st_crs(.x, parameters = TRUE)$Wkt) |>
        tibble::rowid_to_column() |>
        tidyr::pivot_longer(-rowid, names_to = 'sf_dataset', values_to = 'Wkt') |>
        dplyr::select(-rowid)
        , by = 'sf_dataset')
    }
