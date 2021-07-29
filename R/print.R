#' @export
#' @method  print tbl_df
print.tbl_df <- paint

#' @export
#' @method print data.frame
print.data.frame <- paint

#' @export
#' @method print sf
print.sf <- paint