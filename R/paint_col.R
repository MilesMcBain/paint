#' @export
paint_col <- function(col, palette) UseMethod("paint_col", col)

#' @export
paint_col.default <- function(col, palette) {
  painter <- make_painter(palette)
  painted <- paste(unlist(lapply(col, painter)), collapse = " ")
  painted
}

#' @export
paint_col.data.frame <- function(col, palette) {
  paint_head(col)
}

#' @export
paint_col.list <- function(col, palette) {
  col <- crayon::strip_style(unlist(lapply(col, paint_head)))
  NextMethod()
}

#' @export
paint_col.sfc <- function(col, palette) {
  col <- crayon::strip_style(unlist(lapply(col, paint_head)))
  NextMethod()
}

make_painter <- function(colour_funs) {
  index <- 0
  pal_length <- length(colour_funs)
  if (getOption("paint_dark_mode", FALSE)) {
    colour_funs <- lapply(colour_funs, function(x) x$blurred)
  }
  function(char_elem) {
    painted <- colour_funs[[index + 1]](char_elem)
    if (is.na(char_elem)) painted <- colour_funs[[index + 1]]$inverse(char_elem)
    index <<- (index + 1) %% pal_length
    painted
  }
}