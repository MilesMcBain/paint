#' Interatively scroll through rows of a painted dataframe
#'
#' This function calls [paint()] repeatedly on a dataframe,
#' updating the rows shown in response to keypresses.
#'
#' It will only work in terminals supported by {keypress} - Not many!
#'
#' Controls:
#'
#' - 'l' or 'right arrow' forward 1 row
#' - 'h' or 'left arrow' backward 1 row
#' - 'enter' or 'escape' quit interactive painting
#' - 'b' backward 1 page of rows
#' - 'f' forward 1 page of rows
#' - 'G' jump to final page of rows
#' - 'g' jump to first page of rows
#'
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
  while (key != "enter" && key != "escape") {
    if (key == "left" || key == "h") {
      old_row <- row
      row <- max(1, row - 1)
      if (row < old_row) palette <- rotate_palette_backward(palette)
    } else if (key == "right" || key == "l") {
      old_row <- row
      row <- min(nrow(df), row + 1)
      if (row > old_row) palette <- rotate_palette_forward(palette)
    } else if (key == "f") {
      # forward 1 page
      next_page_row_start <-
        row + getOption("paint_n_rows", length(palette))
      if (next_page_row_start <= nrow(df)) {
        row <- next_page_row_start
        # palette stays the same as advancing exactly 1 page
      }
    } else if (key == "b") {
      # back one page
      previous_page_row_start <-
        row - getOption("paint_n_rows", length(palette))
      if (previous_page_row_start >= 1) {
        row <- previous_page_row_start
        # palette stays the same as retreating by exactly 1 page
      }
    } else if (key == "g") {
      # first page
      start_diff <- row - 1
      row <- 1
      if (start_diff > 0) palette <- rotate_palette_backward_n(palette, start_diff)
    } else if (key == "G") {
      # last page
      last_page_row_start <-
        nrow(df) - getOption("paint_n_rows", length(palette)) + 1
      end_diff <- last_page_row_start - row
      if (end_diff > 0) {
        row <- last_page_row_start
        palette <- rotate_palette_forward_n(palette, end_diff)
      }
    }
    paint_to_output_buffer(df, palette = palette, start_row = row)
    row_footer_to_output_buffer(row, df, palette)

    if (key != "") {
      buffer_size <- get_output_buffer_rows()
      cat(sprintf("\033[%dA\r", buffer_size - 1)) # back to first row
      cat(blank_buffer(buffer_size))
      cat(sprintf("\033[%dA\r", buffer_size - 1))
    }

    cat(get_output_buffer(), sep = "")
    reset_output_buffer()

    key <- keypress::keypress()
  }
}

rotate_palette_forward <- function(palette) {
  c(palette[2:length(palette)], palette[[1]])
}

rotate_palette_backward <- function(palette) {
  c(palette[[length(palette)]], palette[1:(length(palette) - 1)])
}

rotate_palette_forward_n <- function(palette, n) {
  idx <- seq_along(palette)
  idx_rotated <- (idx + n) %% length(palette)
  idx_rotated[idx_rotated == 0] <- length(palette)
  idx_rotated
  palette[idx_rotated]
}

rotate_palette_backward_n <- function(palette, n) {
  idx <- seq_along(palette)
  idx_rotated <- (idx - n) %% length(palette)
  idx_rotated[idx_rotated == 0] <- length(palette)
  idx_rotated
  palette[idx_rotated]
}

row_footer_to_output_buffer <- function(row, df, palette) {
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

  append_to_output_buffer(
    "\n",
    "\n",
    row_message,
    "\n",
    instructions,
    "\n"
  )
}

blank_buffer <- function(n_rows) {
  line <- strrep(" ", getOption("paint_max_width", 60))
  paste0(rep(line, n_rows), collapse = "\n")
}
