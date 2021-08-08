#' Interatively scroll through rows of a painted dataframe
#' 
#' This function calls [paint()] repeatedly on a dataframe, 
#' updating the rows shown in response to left or right keypresses.
#' 
#' It will only work in terminals supported by {keypress} - Not many!
#' 
#' In order to paint the `df` in the same place each time this function outputs a
#' whole lot of newlines in between paints. This will eat up your terminal scroll buffer,
#' so DO NOT use this if there's information currently in the terminal that is important to you.
#' 
#' @param df the dataframe to scroll through, defaults to `.Last.value`
#' @export
ipaint <- function(df = .Last.value) {
	if (!keypress::has_keypress_support()) {
		stop("Sorry your terminal is not supported by {keypress}.")
	}
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
	cat("\n")
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
