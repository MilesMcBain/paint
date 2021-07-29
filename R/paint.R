#' @export
paint <- function(object, ...) UseMethod("paint", object)


#' @export
paint.data.frame <- function(
  df,
  name = NULL,
  palette = getOption("paint_palette", rainbow_6)
) {
  col_types <- lapply(df, paint_col_type)
  col_names <- colnames(df)
  col_dims <- lapply(df, dim)
  cols <- mapply(
    paint_col,
    head(df, getOption("paint_n_rows", length(palette))),
    col_dims,
    MoreArgs = list(palette = palette)
  )
  if (getOption("paint_align_metadata", "unset") != "none") {
    col_names <- align_str(col_names)
    col_types <- align_str(col_types)
  }
  col_lines <- paste0(col_names, " ", col_types, " ", cols)
  cropped_lines <- crop_lines(col_lines, getOption("paint_max_width", 60))
  col_block <- paste0(cropped_lines, collapse = "\n")
  name <- paint_name(name)
  header <- trimws(paste(name, paint_head(df))) # the name is used for nested data.frames
  meta <- paint_meta(df)
  cat(header, "\n")
  if (!is.null(meta)) cat(meta, "\n")
  cat(col_block, "\n")
  # paint nested data frames
  nested_data_frame_idxs <- which(trimws(crayon::strip_style(col_types)) == "df")
  lapply(
    nested_data_frame_idxs,
    function(idx) {
      cat("\n")
      paint(df[[idx]], name = names(df)[idx], palette = palette)
    }
  )
  invisible()
}



function() {

  library(paint)
  library(nycflights13)
  library(tidyverse)
  library(sf)
  library(data.table)
  library(spData)
  library(spDataLarge)
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

  tst <- mtcars %>%
    mutate(
      mtcars_mat = as.matrix(mtcars)
    ) 
  
  tst1 <-  
  tibble(
     this = c("1", "2", NA),
     that = list(matrix(rep(1,4), nrow = 2), 
            array(rep(1,3), dim = c(3,3,3)),
            array(rep(1,2))
     ) 
   )
   
   tst1 %>%
   mutate(
     nested_tibble = as_tibble(tst1)
   ) %>% paint()

  flights %>%
    group_by(year, month) %>%
    paint()

  flights %>%
    group_by(year, month) %>%
    rowwise() %>%
    paint()


  flights %>%
    rowwise() %>%
    paint()

  nz %>%
  paint()

  tst <- nz
  st_crs(tst) <- NA_crs_
  paint(tst)

  paint(nz)
  paint(flights)

}
