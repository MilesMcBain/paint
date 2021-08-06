mask_data.frame <- function(pkgname, pkgpath) {
  .S3method("print", "data.frame", paint)
  mask_reminder_message("data.frame")
}

mask_tibble <- function(pkgname, pkgpath) {
  .S3method("print", "tbl_df", paint)
  mask_reminder_message("tbl_df")
}

mask_sf <- function(pkgname, pkgpath) {
  .S3method("print", "sf", paint)
  mask_reminder_message("sf")
}

mask_data.table <- function(pkgname, pkgpath) {
  .S3method("print", "data.table", paint)
  mask_reminder_message("data.table")
}

#' mask print methods for paintable dataframes
#' 
#' This function replaces the original paint methods for supported data.frame
#' sub classes with calls to `paint()` in the current session. The utility of
#' this is that `paint()` will be called whenever `print()` would, for example
#' at the end of an expression when coding interactively. 
#' 
#' This also makes paint usable with other tools that output to console e.g. `{breakerofchains}`.
#' 
#' If you really like `paint()` you could put `paint::mask_print()` in your `.Rprofile`.
#' 
#' By default a colourful reminder message is emitted whenever print methods are
#' replaced, which may not happen until the package that contains them is actually
#' loaded, e.g. after `library(tibble)`. This can be disabled with `options(paint_remind_mask_print = FALSE)`
#' @seealso [unpaint()] A method for calling the default print functions once for a single object or .Last.value.
#' @export
mask_print <- function() {
  mask_data.frame()
  if (isNamespaceLoaded("tibble")) {
    mask_tibble()
  } else {
    setHook(packageEvent("tibble", "onLoad"), mask_tibble)
  }
  if (isNamespaceLoaded("sf")) {
    mask_sf()
  } else {
    setHook(packageEvent("sf", "onLoad"), mask_sf)
  }
  if (isNamespaceLoaded("data.table")) {
    mask_data.table()
  } else {
    setHook(packageEvent("data.table", "onLoad"), mask_data.table)
  }
}

unmask_data.frame <- function() {
  .S3method("print", "data.frame", base::print.data.frame)
  unmask_reminder_message("data.frame")
}

unmask_tibble <- function() {
  .S3method("print", "tbl_df", tibble:::print.tbl_df)
  unmask_reminder_message("tbl_df")
}

unmask_sf <- function() {
  .S3method("print", "sf", sf:::print.sf)
  unmask_reminder_message("sf")
}

unmask_data.table <- function() {
  .S3method("print", "data.table", data.table:::print.data.table)
  unmask_reminder_message("data.table")
}

#' @describeIn mask_print the reverse operation to `mask_print`: return all print methods to defaults.
#' @export
unmask_print <- function() {
  unmask_data.frame()
  if (isNamespaceLoaded("tibble")) {
    unmask_tibble()
  }
  if (isNamespaceLoaded("sf")) {
    unmask_sf()
  }
  if (isNamespaceLoaded("data.table")) {
    unmask_data.table()
  }
}

mask_reminder_message <- function(class) {
  if (getOption("paint_remind_mask_print", TRUE)) message(rainbow_text(paste0("{paint} masked print.", class)))
}

unmask_reminder_message <- function(class) {
  if (getOption("paint_remind_mask_print", TRUE)) message(rainbow_text(paste0("{paint} unmasked print.", class)))
}
