#' @export
paint <- function(object, ...) UseMethod("paint", object)


#' @export
paint.data.frame <- function(
  df,
  name = NULL,
  palette = getOption("paint_palette", rainbow_6()  )
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
  invisible(df)
}