#' Paint a rectangle in the data.frame family
#'
#' {paint} is an alternative print method of objects that are of class
#' `data.frame`. It has been described as a "pretty [pillar::glimpse()]", since it
#' also favours printing columns running horizontally.
#'
#' {paint} tries to be low noise by using colour instead of markup characters.
#' It also highlights important values like `NA`, `NULL`, `NaN`, and `Inf`.
#'
#' Each supported sub-class of `data.frame` has a custom meta data header,
#' designed to show useful information for wrangling.
#'
#' The appearance of the output can be customised with options:
#'
#'  * `paint_palette` the palette to paint row colours with, defaults to
#'    `rainbow_6()`, 6 standard ANSI colours that are supported in most terminals.
#'  * `paint_n_rows` the number of rows to print for each column. Defaults to the
#'    number of colours in the `paint_palette`, but can be set higher for repeating sequences.
#'  * `paint_max_width` the maximum width of the output. 60 is the default. `{paint}` does not resize
#'    based on terminal width by design.
#'  * `paint_align_row_head = c("left", "center", "right")`. How to align the column
#'    title and type. Defaults to `"left"`.
#'  * `paint_dark_mode` darken the `paint_palette` using `crayon::blurred` - not
#'    supported in all terminals.
#' @param df the dataframe to paint
#' @param ... further arguments to class specific paint methods
#' @return df invisibly. Text outputed printed to console.
#' @export
#' @seealso [unpaint()] for calling the default print method on a dataframe
#' @examples
#' paint(mtcars)
paint <- function(df, ...) UseMethod("paint", df)

#' @export
paint.data.frame <- function(
  df,
  name = NULL,
  palette = getOption("paint_palette", rainbow_6()),
  start_row = NULL, # used to support ipaint()
  ...
) {
  if (ncol(df) == 0) {
    output(paint_head(df), "\n")
    return(invisible(df))
  }
  col_types <- lapply(df, paint_col_type)
  col_names <- colnames(df)
  col_dims <- lapply(df, dim)
  rows_to_paint <-
    utils::head(
      offset(df, start_row),
      getOption("paint_n_rows", length(palette))
    )
  cols <- mapply(
    paint_col,
    rows_to_paint,
    col_dims,
    MoreArgs = list(palette = palette)
  )
  if (getOption("paint_align_row_head", "unset") != "none") {
    col_names <- align_str(col_names)
    col_types <- align_str(col_types)
  }
  col_lines <- paste0(col_names, " ", col_types, " ", cols)
  cropped_lines <- crop_lines(col_lines, getOption("paint_max_width", 60))
  col_block <- paste0(
    sanitise_text(cropped_lines),
    collapse = "\n"
  )
  name <- paint_name(name)
  header <- trimws(paste(name, paint_head(df))) # the name is used for nested data.frames
  meta <- paint_meta(df)
  output(header, "\n")
  if (!is.null(meta)) output(meta, "\n")
  output(col_block, "\n")
  # paint nested data frames
  nested_data_frame_idxs <- which(trimws(crayon::strip_style(col_types)) == "df")
  lapply(
    nested_data_frame_idxs,
    function(idx) {
      output("\n")
      paint(df[[idx]], name = names(df)[idx], palette = palette)
    }
  )
  invisible(df)
}

offset <- function(df, n) {
  if (is.null(n)) {
    return(df)
  }
  df[seq(n, nrow(df)), ]
}