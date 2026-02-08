#' Attempt to transform chars in encodings we don't understand, rather than crash crayon.
#' @author Miles McBain
#' @param col the column to sanitise, a vector
sanitise_col <- function(col) {
      sanitise_text(
        ifelse(!validEnc(col), stringi::stri_trans_general(col, "latin-ascii"), col)
      )
}
