# The flagging function determines what things in the column should be flagged -
# colours inverted.
# This really only needed to be created for vctrs since not all of them support
# is.infinite() gracefully

#' @export
flag_item <- function(item) UseMethod("flag_item")

#' @export
flag_item.default <- function(item) {

  if (length(item) > 1) stop("You gave me an item of length > 1 to flag")

  if (is.null(item)) return(TRUE)

  if (isTRUE(is.na(item))) return(TRUE)

  FALSE
}

#' @export
flag_item.numeric <- function(item) {
  if (is.infinite(item)) return(TRUE)
  NextMethod()
}  

#' @export
flag_item.vctrs_vector <- function(item) {
  if (is_infinite_safely(item)) return(TRUE)
  NextMethod()
}
