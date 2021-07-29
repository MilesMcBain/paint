



#' @export
paint <- function(object, ...) UseMethod("paint", object)


#' @export
paint.data.frame <- function(df, palette = getOption("paint_palette", rainbow_6)) {
  col_types <- lapply(df, paint_col_type)
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

#' @export
paint.tbl_df <- function()

paint.default <- function(object) {
  print(object)
}


function() {

  library(nycflights13)
  library(tidyverse)
  library(sf)
  library(data.table)
  library(spData)
  options(paint_palette = brewer_pastel2_7)
  options(paint_palette = brewer_set3_12)
  options(paint_dark_mode = FALSE)
  options(paint_palette = viridis_6)
  options(paint_palette = rainbow_6)
  options(paint_palette = brewer_accent_7)
  options(paint_align_metadata = "right")
  paint(as.data.frame(flights))
  paint(flights)
  paint(as.data.table(flights))
  paint(mtcars)
  paint(iris)
  paint(data.frame(
    cool = c("a", NA, "c"),
    stuff = c(1, 2, 3)
  ))

    iris %>%
    nest(cols = starts_with("Sepal")) %>%
    paint()

   iris %>%
   mutate(
     nested_tibble = iris
   ) %>%
   paint()


}
