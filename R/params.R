#' Gets and checks the path for the default YAML params file
#'
#' @param file Path and name of the file to be checked
#' @return The full path of the configuration file
#'
journalrank_params_getpath <- function(file = NULL) {
  if (is.null(file)) {
    path <- system.file("journalrank_params.yml", package = "journalrank")
  } else {
    path <- system.file(file)
  }

  if (identical(path, "")) {
    stop(ERR_configloading, call. = FALSE)
  }

  path
}

#' Reads the configuration file and returns a `journalrank_params` object
#'
#' @param file Path and name of the file containing the configuration parameters. By default reads the configuration file included with the package
#' @return A `journalrank_params` object
#' @seealso \code{\link{journalrank_params_open}}
#' @examples
#' \donttest{
#' # Read the default configuration parameters file
#' params <- journalrank_params_get()
#'
#' # Read a personal configuration file
#' params <- journalrank_params_get("MyProject/MyConfFile.yml")
#' }
#' @export
#'
journalrank_params_get <- function(file = NULL) {
  path = journalrank_params_getpath(file)
  params <- yaml::read_yaml(path)
  class(params) <- "journalrank_params"

  params
}

#' Opens the internal configuration file in the default editor, so that the user can change it
#'
#' @export
#'
journalrank_params_open <- function() {
  options(editor = "internal")
  utils::file.edit(journalrank_params_getpath(), title = "journalrank params")
}
