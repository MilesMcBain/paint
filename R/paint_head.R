# head
# The head is the combination of an object name and stub
# Eg in tibble [100, 10] "tibble" is the name "[100, 10]" is the stub

#' @export
paint_head <- function(object) UseMethod("paint_head")

#' @export
paint_head.default <- function(object) {

  if (length(object) == 0) {
	  stop("Got passed a zero length object to paint_head")
	}
	if (is_scalar(object)) {
		if (is.na(object) || is.null(object) || is.infinite(object)) {
      stop("Got passed a non-data object to paint_head")
    }
	}
  paint_head_template(class(object)[[1]], object)
}

#' @export
paint_head.tbl_df <- function(object) paint_head_template("tibble", object)

#' @export
paint_head.tbl_ts <- function(object) paint_head_template("tsibble", object)

#' @export
paint_head.sf <- function(object) paint_head_template("sf", object)

#' @export
paint_head.sfg <- function(object) {
  name <- as.character(sf::st_geometry_type(object))
  paint_head_template(name, object)
}

#' @export
paint_head.MULTIPOLYGON <-
  function(object) paint_head_template("MPOLY", object)

#' @export
paint_head.LINESTRING <-
  function(object) paint_head_template("LINES", object)

#' @export
paint_head.POLYGON <-
  function(object) paint_head_template("POLY", object)

#' @export
paint_head.MULTILINESTRING <-
  function(object) paint_head_template("MLINES", object)

#' @export
paint_head.MULTIPOINT <-
  function(object) paint_head_template("MPOINT", object)

#' @export
paint_head.GEOMETRYCOLLECTION <-
  function(object) paint_head_template("GEOMCOL", object)


paint_head_template <- function(name, object) {
  name <- paint_name_template(name)
  stub <- paint_stub(object)
  paste(name, stub)
}

paint_name_template <- function(name) {
  crayon::silver(name)
}

function() {
  cat(paint_head(flights))
  cat(paint_head(nz))
  cat(paint_head(mtcars))
  cat(paint_head(letters))
  cat(paint_head(as.list(letters)))
}
