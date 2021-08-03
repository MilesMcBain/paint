#' @export
unpaint <- function(df) UseMethod("unpaint")

#' @export
unpaint.default <- function(df) print(df)

#' @export
unpaint.tbl_df <- function(df) {
  unpaint_template("tbl_df", tibble:::print.tbl_df, df)
}

#' @export
unpaint.data.frame <- function(df) {
	unpaint_template("data.frame", base::print.data.frame, df)
}

#' @export
unpaint.data.table <- function(df) {
  unpaint_template("data.table", data.table:::print.data.table, df)
}

#' @export
unpaint.sf <- function(df) {
  unpaint_template("sf", sf:::print.sf, df)
}

#' @export
unpaint.NULL <- function(df) {
  if (!is.null(.Last.value)) unpaint(.Last.value)
}

unpaint_template <- function(class, fn, df) {
old_method <- getS3method("print", class)
  .S3method("print", class, fn)
  on.exit(.S3method("print", class, old_method))
  print(df)
}
