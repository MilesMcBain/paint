#' stub 
#'
#' The stub is the bit after the name in the object title e.g. tibble [row,
#' cols] - stub is the dimensions summary after "tibble"

#' @export
paint_stub <- function(object) UseMethod("paint_stub") 

#' @export
paint_stub.default <- function(df) {
	rows <- NROW(df)
	cols <- NCOL(df)

  if (is.vector(df)) {
	  dims <- paste0("[",rows,"]")
	}
	else {
	  dims <- paste0("[",rows, ", ", cols,"]")
	}
	paint_stub_template(dims)
}

#' @export
paint_stub.array <- function(array) {
	dims <- paste0("[", paste0(dim(array),collapse = ", "), "]")
	paint_stub_template(dims)
}

#' @export
paint_stub.sfg <- function(sfg) {
  size <- capture.output(print(pryr::object_size(sfg)))
	paint_stub_template(size)
}

#' @export
paint_stub_template <- function(dims) {
	crayon::silver(dims)
}

function() {
  paint_stub(letters)
	paint_stub(matrix(1:9, nrow = 3))
}