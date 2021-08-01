is_scalar <- function (x) NROW(x) == 1 && NCOL(x) == 1

sanitise_text <- function(x) {
  gsub("\n|\r|\t", " ", x)
}

#' @export
rainbow_text <- function(msg) {
  rainbow <- make_painter(getOption("paint_palette", rainbow_6()))
  exploded <- strsplit(msg, "*")[[1]]
  coloured <- lapply(exploded, rainbow)
  paste0(coloured, collapse = "") 
}

is_infinite_safely <- function(x) {
  tryCatch(is.infinite(x), error = function(e) FALSE)
} 

