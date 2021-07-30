align_str <- function(chr) {
  max_width <- max(crayon::col_nchar(chr))
  crayon::col_align(chr, width = max_width, align = getOption("paint_align_row_head", "left"))
}

crop_lines <- function(lines, max_width) {
  long_lines <- crayon::col_nchar(lines) > max_width
  lines[long_lines] <- paste0(
    crayon::col_substring(lines[long_lines], 1, max_width - 1),
    crayon::bold("~")
  )
  lines
}