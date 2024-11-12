#' set up directories
#'
#' @description
#' This creates commonly-used directories quickly, instead of manually making each folder, one at a time. If a directory with that name already exists in the chosen location, a new one is NOT created.
#'
#' @param proj_root the project's root folder, this is where the new folders will be created.
#' @param folders a vector of strings contianing the names of the new folders to make
#'
#' @examples
#' (proj_root <- file.path(getwd()))
#' (folders <-
#'   c(
#'     'figures'
#'   , 'scripts'
#'   , 'input_data'
#'   , 'output_tables'
#'   , 'zipped_inputs'
#'   , 'saved_sessions'
#'   ))
#'
#'   set_up_dirs(proj_root, folders)
set_up_dirs <-
  function(proj_root, folders) {
    for(i in folders){
      ifelse(!dir.exists(file.path(proj_root, i)), dir.create(file.path(proj_root, i)), FALSE)
    }
  }
