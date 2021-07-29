#' @export
paint_col_type <- function(col) UseMethod("paint_col_type", col)

#' @export
paint_col_type.default <- function(col) {
  paint_col_type_template(class(col)[[1]])
}

#' @export
paint_col_type.double <- function(col) {
  paint_col_type_template("dbl")
}

#' @export
paint_col_type.integer <- function(col) {
  paint_col_type_template("int")
}

#' @export
paint_col_type.character <- function(col) {
  paint_col_type_template("chr")
}

#' @export
paint_col_type.factor <- function(col) {
  paint_col_type_template("fct")
}

#' @export
paint_col_type.POSIXct <- function(col) {
  paint_col_type_template("dttm")
}

#' @export
paint_col_type.Date <- function(col) {
  paint_col_type_template("date")
}

#' @export
paint_col_type.logical <- function(col) {
  paint_col_type_template("lgl")
}

#' @export
paint_col_type.data.frame <- function(col) {
  paint_col_type_template("df")
}

#' @export
paint_col_type.sfc <- function(col) {
  paint_col_type_template("sfc")
}
#' @export
paint_col_type.list <- function(col) {
  paint_col_type_template("lst")
}

paint_col_type_template <- function(type_code) {
  crayon::silver(type_code)
}
