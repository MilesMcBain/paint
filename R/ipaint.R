ipaint <- function(df) {
  row <- 1
  palette <- getOption("paint_palette", rainbow_6())
  key <- ""
  while (key != "enter") {
    cat(rep("\n", 100))
    if (key == "left" || key == "h") {
			old_row <- row
      row <- max(1, row - 1)
			if (row < old_row) palette <- rotate_palette_backward(palette)
    } else if (key == "right" || key == "l") {
			old_row <- row
      row <- min(nrow(df), row + 1)
			if (row > old_row) palette <- rotate_palette_forward(palette)
    }
    paint(df, palette = palette, start_row = row)
		row_footer(row, df, palette)
    key <- keypress::keypress()
  }
}

rotate_palette_forward <- function(palette) {
  c(palette[2:length(palette)], palette[[1]])
}

rotate_palette_backward <- function(palette) {
  c(palette[[length(palette)]], palette[1:(length(palette) - 1)])
}

row_footer <- function(row, df, palette) {
	min_row <- row
	row_width <- getOption("paint_n_rows", length(palette))
	max_row <- min(nrow(df), (min_row + row_width) - 1)
	row_message <- 
	paste0(
		crayon::silver("painting rows: "),
		min_row,
		crayon::silver(" to "),
		max_row
	)
	instructions <- 
	  crayon::silver("scroll with <-,h,l,-> or Enter to exit")
	cat(
		"\n", "\n",
		row_message, "\n",
		instructions,
		sep = ""
	)
}
