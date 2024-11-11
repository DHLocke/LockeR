#' Paralise any simple features analysis.
#' thanks Phil Donovan @philip_donovan
#' originally posted here https://www.spatialanalytics.co.nz/post/2018/04/01/fixing-st-par/
#'
#' @description
#' This function parallelizes sf functions to speed-up larger processing tasks by using multiple cores. https://www.spatialanalytics.co.nz/post/2018/04/01/fixing-st-par/ for additional information
#'
#' @import parallel
#' @param sf_df simple features data frame. This is the input sf object.
#' @param sf_function the sf function you wish to perform
#' @param n_cores the number of cores to use.
#' @param ... other options associated with the chosen sf_function
#'
#' @examples
#' library(spData)
#' data(us_states)
#' us_states |> plot()
#'
#' # make points within states
#' # make a bounding box
#' us_states_union <-
#'   us_states |>
#'   dplyr::group_by() |>
#'   dplyr::summarise()
#'
#' # make points inside polygon
#' sample_size <- 1e4
#' us_points <-
#'   sf::st_sample(us_states_union, size = sample_size) |>
#'   sf::st_as_sf() |>
#'   tibble::rowid_to_column(var = 'id')
#'
#' # spatially join the points to the original polygons with sf::st_intersection
#' # withOUT parallelization
#' start.time <- Sys.time()
#' intersect_serial <-
#'   us_points |>
#'    st_intersection(us_states)
#' end.time <- Sys.time()
#' end.time - start.time # elapsed time, in serial
#'
#' # now WITH parallelization, but first how many cores are available?
#' parallel::detectCores()  # n_cores needs to be less than this number
#' start.time <- Sys.time()
#' intersect_parallel <-
#'   us_points |>
#'   st_parallel(
#'       sf_func = st_intersection
#'     , n_cores = 3
#'     , us_states
#'   )
#' end.time <- Sys.time()
#' end.time - start.time # elapsed time, in parallel, roughly a 3x speed up
st_parallel <- function(sf_df, sf_func, n_cores, ...){

  # Create a vector to split the data set up by.
  split_vector <- rep(1:n_cores, each = nrow(sf_df) / n_cores, length.out = nrow(sf_df))

  # Perform GIS analysis
  split_results <- split(sf_df, split_vector) %>%
    parallel::mclapply(function(x) sf_func(x, ...), mc.cores = n_cores)


  # Define the output_class. If length is greater than two, then grab the second variable.
  output_class <- class(split_results[[1]])
  if (length(output_class) == 2){
    output_class <- output_class[2]
  }

  # Combine results back together. Method of combining depends on the output from the function.
  if (output_class == "matrix"){
    result <- do.call("rbind", split_results)
    names(result) <- NULL
  } else if (output_class == "sfc") {
    result <- do.call("c", split_results)
    result <- sf_func(result) # do.call combines the list but there are still n_cores of the geometry which had been split up. Running st_union or st_collect gathers them up into one, as is the expected output of these two functions.
  } else if (output_class %in% c('list', 'sgbp') ){
    result <- do.call("c", split_results)
    names(result) <- NULL
  } else if (output_class == "data.frame" ){
    result <- do.call("rbind", split_results)
  } else {
    stop("Unknown class. st_parallel only accepts the following outputs at present: sfc, list, sf, matrix, sgbp.")
  }

  # Return result
  return(result)
}
