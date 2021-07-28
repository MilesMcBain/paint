
make_painter <- function(colour_funs) {
  index <- 0
  pal_length <- length(colour_funs)
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

paint_col_head <- function(col, col_name) UseMethod("paint_col_head", col)
paint_col <- function(col, palette) UseMethod("paint_col", col)
paint <- function(object, ...) UseMethod("paint", object)

paint_col.default <- function(col, col_name, palette) {
  painter <- make_painter(palette)
  painted <- paste(unlist(lapply(col, painter)), collapse = " ")
  painted
}

paint_col_head.double <- function(col, col_name) {
  paint_col_head_template(col_name, "dbl")
}

paint_col_head.integer <- function(col, col_name) {
  paint_col_head_template(col_name, "int")
}
paint_col_head.character <- function(col, col_name) {
  paint_col_head_template(col_name, "chr")
}

paint_col_head.factor <- function(col, col_name) {
  paint_col_head_template(col_name, "fct")
}

paint_col_head.POSIXct <- function(col, col_name) {
  paint_col_head_template(col_name, "dttm")
}

paint_col_head.Date <- function(col, col_name) {
  paint_col_head_template(col_name, "date")
}

paint_col_head_template <- function(col_name, type_code) {
  paste0(col_name, " ", crayon::blurred(type_code))
}

paint.data.frame <- function(df, palette = getOption("paint_palette", rainbow_6)) {
  col_heads <- mapply(paint_col_head, head(df), colnames(df))
  cols <- mapply(paint_col, head(df), MoreArgs = list(palette = palette))
  if (getOption("paint_align_data", "left") != "none") {
    col_heads <- align_str(col_heads)
  }
  col_lines <- paste0(col_heads, " ", cols)
  cropped_lines <- crop_lines(col_lines, getOption("paint_max_width", 60))
  col_block <- paste0(cropped_lines, collapse = "\n")
  cat(col_block, "\n")
}

paint.tbl_df <- function(x) {}

paint.sf <- function(x) {}

paint.default <- function(col, palette) {
  print(col)
}

align_str <- function(chr) {
  max_width <- max(crayon::col_nchar(chr))
  crayon::col_align(chr, width = max_width, align = getOption("paint_align_data", "right"))
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
  paint(as.data.frame(flights))
  paint(mtcars)
  paint(iris)
  paint(data.frame(
    cool = c("a", NA, "c"),
    stuff = c(1, 2, 3)
  ))

}