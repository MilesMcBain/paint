OUTPUT_TO_BUFFER <- FALSE
OUTPUT_BUFFER <- NULL

output <- function(...) {
  if (!OUTPUT_TO_BUFFER) {
    cat(..., sep = "")
  } else {
    append_to_output_buffer(...)
  }
}

append_to_output_buffer <- function(...) {
  OUTPUT_BUFFER <<-
    c(
      OUTPUT_BUFFER,
      unlist(list(...))
    )
}

reset_output_buffer <- function() {
  OUTPUT_BUFFER <<- NULL
}

get_output_buffer <- function() {
  OUTPUT_BUFFER
}

get_output_buffer_rows <- function() {
  newlines <-
    lapply(
      gregexpr("(?<!\\\\)\n", get_output_buffer(), perl = TRUE),
      function(match) {
        if (length(match) == 1 && match == -1) 0 else length(match)
      }
    ) |>
    unlist() |>
    sum()

  newlines + 1
}

paint_to_output_buffer <- function(...) {
  OUTPUT_TO_BUFFER <<- TRUE
  on.exit(OUTPUT_TO_BUFFER <<- FALSE)
  paint(...)
}