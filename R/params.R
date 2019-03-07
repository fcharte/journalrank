#' Get and check the path for the YAML params file
journalrank_params_getpath <- function() {
  path <- system.file("journalrank_params.yml", package = "journalrank")

  if (identical(path, "")) {
    stop("Configuration parameters can't be loaded", call. = FALSE)
  }

  path
}

#' Reads the configuration file and returns a `journalrank_params` object
#'
#' @param path Path and name of the file containing the configuration parameters. By default reads the configuration file included with the package
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
journalrank_params_get <- function(path = journalrank_params_getpath()) {
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
