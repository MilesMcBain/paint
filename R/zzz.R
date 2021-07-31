patch_data.frame <- function(pkgname, pkgpath) {
  .S3method("print", "data.frame", paint)
  packageStartupMessage(rainbow_text("{paint} masked print.data.frame"))
}

patch_tibble <- function(pkgname, pkgpath) {
  .S3method("print", "tbl_df", paint)
  packageStartupMessage(rainbow_text("{paint} masked print.tbl_df"))
}

patch_sf <- function(pkgname, pkgpath) {
  .S3method("print", "sf", paint)
  packageStartupMessage(rainbow_text("{paint} masked print.sf"))
}

patch_data.table <- function(pkname, pkgpath) {
  .S3method("print", "data.table", paint)
  packageStartupMessage(rainbow_text("{paint} masked print.data.table"))
}

.onAttach <- function(libname, pkgname) {
  if (getOption("paint_mask_print", FALSE)) {
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

