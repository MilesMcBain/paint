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

is_infinite_value_safely <- function(x) {
  if (length(x) != 1) return(FALSE)
  tryCatch(is.infinite(x), error = function(e) FALSE)
} 

is_na_value_safely <- function(x) {
  if (!is.vector(x)) return(FALSE)
  if (length(x) != 1) return(FALSE)
  tryCatch(is.na(x), error = function(e) FALSE)
}

