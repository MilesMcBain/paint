#' stub 
#'
#' The stub is the bit after the name in the object title e.g. tibble [row,
#' cols] - stub is the dimensions summary after "tibble"

#' @export
paint_stub <- function(object) UseMethod("paint_stub") 

#' @export
paint_stub.default <- function(df) {

  if (is.null(df)) stop("paint_stub got passed NULL")
  if (is_na_value_safely(df)) stop("paint_stub got passed NA")
	if (is_infinite_value_safely(df)) stop("paint_stub got passed an infinite value")

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
	trimmed_size <- gsub("\\s", "", size)
	paint_stub_template(trimmed_size)
}

#' @export
paint_stub_template <- function(dims) {
	crayon::silver(dims)
}

function() {
  paint_stub(letters)
	paint_stub(matrix(1:9, nrow = 3))
}