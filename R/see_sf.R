# # see which objects are of type sf
# # thanks Kelly Hondula
# # https://scholar.google.com/citations?user=Xdhvu9QAAAAJ&hl=en
#' get sf objects in memory as character vector
#'
#' @import sf
#' @import sfdep
#' @return a character vector
#' @export
#'
#' @seealso [see_spatial()]
#'
#' @examples
#' see_sf()                 # nothing
#' library(sfdep)
#' test_sf_object <- guerry # a built in dataset in the sfdep package
#' see_sf()                 # character string of sf objects
#' # want to find objects of class sp, sf, or RasterLayer [see_spatial()]
#' # TODO link to get_crs
see_sf <-
  function(){
    # what's in memory that are sf - simple features?
    purrr::keep(eapply(.GlobalEnv, base::class),        # gets the objects in the global environment
                ~ any(stringr::str_detect(., "sf"))) |> # selects elements with sf in them
      names() |>
      as.character()       # my simple features, as a character vector
  }

#' @seealso [see_spatial()]
