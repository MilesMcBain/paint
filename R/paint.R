
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

rainbow_6 <-
  list(
    crayon::red,
    crayon::yellow,
    crayon::cyan,
    crayon::green,
    crayon::magenta,
    crayon::blue
  )

viridis_6 <-
  lapply(viridisLite::viridis(6), crayon::make_style)

brewer_set3_12 <-
  lapply(RColorBrewer::brewer.pal(12, name = "Set3"), crayon::make_style)

brewer_pastel1_8 <-
  lapply(RColorBrewer::brewer.pal(8, name = "Pastel1"), crayon::make_style)

brewer_pastel2_7 <-
  lapply(RColorBrewer::brewer.pal(7, name = "Pastel2"), crayon::make_style)

brewer_dark2_7 <-
  lapply(RColorBrewer::brewer.pal(7, name = "Dark2"), crayon::make_style)

brewer_accent_7 <-
  lapply(RColorBrewer::brewer.pal(7, name = "Accent"), crayon::make_style)


#' @export
paint_col_type <- function(col) UseMethod("paint_col_type", col)

#' @export
paint_col <- function(col, palette) UseMethod("paint_col", col)

#' @export
paint <- function(object, ...) UseMethod("paint", object)

#' @export
paint_head <- function(object) UseMethod("paint_head")

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
paint_col_type.double <- function(col) {
  paint_col_type_template("dbl")
}

#' @export
paint_col_type.integer <- function(col) {
  paint_col_type_template("int")
}

#' @export
paint_col_type.character <- function(col) {
  paint_col_type_template("chr")
}

#' @export
paint_col_type.factor <- function(col) {
  paint_col_type_template("fct")
}

#' @export
paint_col_type.POSIXct <- function(col) {
  paint_col_type_template("dttm")
}

#' @export
paint_col_type.Date <- function(col) {
  paint_col_type_template("date")
}

#' @export
paint_col_type.logical <- function(col) {
  paint_col_type_template("lgl")
}

#' @export
paint_col_type.default <- function(col) {
  paint_col_type(class(col)[[1]])
}

#' @export
paint_col_type.data.frame <- function(col) {
  paint_col_type_template("df")
}

#' @export
paint_col_type.list <- function(col) {
  paint_col_type_template("lst")
}

paint_col_type_template <- function(type_code) {
  crayon::silver(type_code)
}


#' @export
paint_head.default <- function(df) {
  crayon::silver(
    trimws(
      capture.output(str(df, max.level = 0, vec.len = 0, indent.str = "", nest.lev = 0)),
      which = "both"
    )
  )
}

#' @export
paint.data.frame <- function(df, palette = getOption("paint_palette", rainbow_6)) {
  col_types <- mapply(paint_col_type, df)
  col_names <- colnames(df)
  cols <- mapply(paint_col, head(df, getOption("paint_n_rows", length(palette))), MoreArgs = list(palette = palette))
  if (getOption("paint_align_metadata", "unset") != "none") {
    col_names <- align_str(col_names)
    col_types <- align_str(col_types)
  }
  col_lines <- paste0(col_names, " ", col_types, " ", cols)
  cropped_lines <- crop_lines(col_lines, getOption("paint_max_width", 60))
  col_block <- paste0(cropped_lines, collapse = "\n")
  header <- paint_head(df)
  cat("\n", header, "\n", col_block, "\n", sep = "")
}

paint.default <- function(object) {
  print(object)
}

align_str <- function(chr) {
  max_width <- max(crayon::col_nchar(chr))
  crayon::col_align(chr, width = max_width, align = getOption("paint_align_metadata", "left"))
}

crop_lines <- function(lines, max_width) {
  long_lines <- crayon::col_nchar(lines) > max_width
  lines[long_lines] <- paste0(
    crayon::col_substring(lines[long_lines], 1, max_width - 1),
    crayon::bold("~")
  )
  lines
}

function() {

  library(nycflights13)
  library(tidyverse)
  library(sf)
  options(paint_palette = brewer_pastel2_7)
  options(paint_palette = brewer_set3_12)
  options(paint_dark_mode = FALSE)
  options(paint_palette = viridis_6)
  options(paint_palette = rainbow_6)
  options(paint_palette = brewer_accent_7)
  options(paint_align_metadata = "right")
  paint(as.data.frame(flights))
  paint(flights)
  paint(mtcars)
  paint(iris)
  paint(data.frame(
    cool = c("a", NA, "c"),
    stuff = c(1, 2, 3)
  ))

    iris %>%
    nest(cols = starts_with("Sepal")) %>%
    paint()

}
