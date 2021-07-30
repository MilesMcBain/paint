patch_data.frame <- function(pkgname, pkgpath) {
  assign("print.data.frame", paint, .GlobalEnv)
  packageStartupMessage(rainbow_text("{paint} masked print.data.frame"))
}

patch_tibble <- function(pkgname, pkgpath) {
  assign("print.tbl_df", paint, .GlobalEnv)
  packageStartupMessage(rainbow_text("{paint} masked print.tbl_df"))
}

patch_sf <- function(pkgname, pkgpath) {
  assign("print.sf", paint, .GlobalEnv)
  packageStartupMessage(rainbow_text("{paint} masked print.sf"))
}

patch_data.table <- function(pkname, pkgpath) {
  assign("print.data.table", paint, .GlobalEnv)
  packageStartupMessage(rainbow_text("{paint} masked print.data.table"))
}

.onAttach <- function(libname, pkgname) {
  if (getOption("paint_patch_big_4", FALSE)) {
    patch_data.frame()
    if (isNamespaceLoaded("tibble")) {
      patch_tibble()
    } else {
      setHook(packageEvent("tibble", "onLoad"), patch_tibble)
    }
    if (isNamespaceLoaded("sf")) {
      patch_sf()
    } else {
      setHook(packageEvent("sf", "onLoad"), patch_sf)
    }
    if (isNamespaceLoaded("data.table")) {
      patch_data.table()
    } else {
      setHook(packageEvent("data.table", "onLoad"), patch_data.table)
    }
  }
}

rainbow_text <- function(msg) {
  rainbow <- make_painter(getOption("paint_palette", rainbow_6))
  exploded <- strsplit(msg, "*")[[1]]
  coloured <- lapply(exploded, rainbow)
  paste0(coloured, collapse = "") 
}