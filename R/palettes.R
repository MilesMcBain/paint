
#' @title paintpals
#' @rdname paintpals
#' @export
rainbow_6 <- function() {
  list(
    crayon::red,
    crayon::yellow,
    crayon::cyan,
    crayon::green,
    crayon::magenta,
    crayon::blue
  )
}
#' @rdname paintpals
#' @export
viridis_6 <- function() lapply(viridisLite::viridis(6), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_set3_12 <-
  function() {
    lapply(brewer_pal_safely(12, name = "Set3"), crayon::make_style)
  }

#' @rdname paintpals
#' @export
brewer_pastel1_8 <-
  function() lapply(brewer_pal_safely(8, name = "Pastel1"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_pastel2_7 <-
  function() lapply(brewer_pal_safely(7, name = "Pastel2"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_dark2_7 <-
  function() lapply(brewer_pal_safely(7, name = "Dark2"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_accent_7 <-
  function() lapply(brewer_pal_safely(7, name = "Accent"), crayon::make_style)


brewer_pal_safely <- function(...) {
  shim_fun <- RColorBrewer::brewer.pal
  shim_env <- new.env(parent = environment(shim_fun))
  shim_env$rgb <- grDevices::rgb
  environment(shim_fun) <- shim_env
  shim_fun(...)
}

set_lib_paths <- function(lib_vec) {

  lib_vec <- normalizePath(lib_vec, mustWork = TRUE)

  shim_fun <- .libPaths
  shim_env <- new.env(parent = environment(shim_fun))
  shim_env$.Library <- character()
  shim_env$.Library.site <- character()

  environment(shim_fun) <- shim_env
  shim_fun(lib_vec)

}