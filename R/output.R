utils::globalVariables("PAINT_BUFFER")
PAINT_BUFFER <- new.env()

PAINT_BUFFER$OUTPUT_TO_BUFFER <- FALSE
PAINT_BUFFER$OUTPUT_BUFFER <- NULL

output <- function(...) {
  if (!PAINT_BUFFER$OUTPUT_TO_BUFFER) {
    cat(..., sep = "")
  } else {
    append_to_output_buffer(...)
  }
}

append_to_output_buffer <- function(...) {
  PAINT_BUFFER$OUTPUT_BUFFER <-
    c(
      PAINT_BUFFER$OUTPUT_BUFFER,
      unlist(list(...))
    )
}

reset_output_buffer <- function() {
  PAINT_BUFFER$OUTPUT_BUFFER <- NULL
}

get_output_buffer <- function() {
  PAINT_BUFFER$OUTPUT_BUFFER
}

get_output_buffer_rows <- function() {
  newlines <-
    sum(
      unlist(
        lapply(
          gregexpr("(?<!\\\\)\n", get_output_buffer(), perl = TRUE),
          function(match) {
            if (length(match) == 1 && match == -1) 0 else length(match)
          }
        )
      )
    )

  newlines + 1
}

paint_to_output_buffer <- function(...) {
  PAINT_BUFFER$OUTPUT_TO_BUFFER <- TRUE
  on.exit(PAINT_BUFFER$OUTPUT_TO_BUFFER <- FALSE)
  paint(...)
}
