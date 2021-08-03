# head
# The head is the combination of an object name and stub
# Eg in tibble [100, 10] "tibble" is the name "[100, 10]" is the stub

#' @export
paint_head <- function(object) UseMethod("paint_head")

#' @export
paint_head.default <- function(object) {

  if (is.null(object)) stop("paint_head got passed NULL")
  if (is_na_value_safely(object)) stop("paint_head got passed NA")
	if (is_infinite_value_safely(object)) stop("paint_head got passed an infinite value")
	
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

#' @export
paint_head.vctrs_vctr <- function(object) {
  name <- vctrs::vec_ptype_abbr(object)
  paint_head_template(name, object)
}

paint_head_template <- function(name, object) {
  name <- paint_name_template(name)
  stub <- paint_stub(object)
  paste(name, stub)
}

paint_name_template <- function(name) {
  crayon::silver(name)
}
