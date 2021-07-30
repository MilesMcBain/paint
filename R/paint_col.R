#' @export
paint_col <- function(col, ..., palette) UseMethod("paint_col", col)

#' @export
paint_col.default <- function(col, ..., palette) {
  painter <- make_painter(palette)
  painted <- paste(unlist(lapply(col, painter)), collapse = " ")
  painted
}

#' @export
paint_col.data.frame <- function(col, dim, palette) {
  dims <- paste0("[", paste0(dim, collapse = ", "), "]")
  crayon::silver(paste("data.frame", dims))
}

#' @export
paint_col.tbl_df <- function(col, dim, palette) {
  dims <- paste0("[", paste0(dim, collapse = ", "), "]")
  crayon::silver(paste("tibble", dims))
}

#' @export
paint_col.array <- function(col, dim, palette) {
  type <- typeof(col)
  dims <- paste0("[", paste0(dim, collapse = ", "), "]")
  crayon::silver(paste(type, dims))
}

#' @export
paint_col.list <- function(col, ..., palette) {
  col_heads <- lapply_safely(col, paint_head)
  col <- strip_style_safely(col_heads)
  NextMethod()
}

#' @export
paint_col.sfc <- function(col, ..., palette) {
  col_heads <- lapply(col, paint_head)
  col <- strip_style_safely(col_heads)
  NextMethod()
}

#' @export
paint_col.double <- function(col, ..., palette) {
  formatter <- function(x) formatC(x, format = "f", digits = 6, drop0trailing = TRUE)
  col <- lapply_safely(col, formatter)
  NextMethod()
}

make_painter <- function(colour_funs) {
  index <- 0
  pal_length <- length(colour_funs)
  if (getOption("paint_dark_mode", FALSE)) {
    colour_funs <- lapply(colour_funs, function(x) x$blurred)
  }
  function(char_elem) {
    char_elem_was_null <-
      if (is.null(char_elem)) {
        char_elem <- "NULL"
        TRUE
      } else {
        FALSE
      }
    # have to handle null specially because crayon will turn it into character(0)
    if (isTRUE(is.na(char_elem)) || is.infinite(char_elem) || char_elem_was_null) {
      painted <- colour_funs[[index + 1]]$inverse(char_elem)
    } else{
      painted <- colour_funs[[index + 1]](char_elem)
    }
    index <<- (index + 1) %% pal_length
    painted
  }
}
