#' Call the default print methods instead of paint once
#'
#' If you're using `paint()` as your default `print()` for dataframes, you may
#' occasionally want to see an object printed using it's default method. This
#' function does that. 
#' 
#' Either supply the object as the `df` arg, or if it has just been painted, you
#' can call `unpaint()` with no arguments to print the `.Last.value`.
#' 
#' @param df the object to print.
#' @seealso [mask_print()] to use [paint()] by default for dataframes in the current session over `print()`.
#' @export
unpaint <- function(df = .Last.value) {


  cur_data.frame_method <- utils::getS3method("print", "data.frame")
  .S3method("print", "data.frame", base::print.data.frame)
  on.exit(.S3method("print", "data.frame", cur_data.frame_method), add = TRUE)

  if (isNamespaceLoaded("tibble")) {
    cur_tibble_method <- utils::getS3method("print", "tbl_df")
    .S3method("print", "tbl_df", tibble:::print.tbl_df)
    on.exit(.S3method("print", "tbl_df", cur_tibble_method), add = TRUE)
  }
  if (isNamespaceLoaded("data.table")) {
    cur_data.table_method <- utils::getS3method("print", "data.table")
    .S3method("print", "data.table", data.table:::print.data.table)
    on.exit(.S3method("print", "data.table", cur_data.table_method), add = TRUE)
  }
  if (isNamespaceLoaded("sf")) {
    cur_sf_method <- utils::getS3method("print", "sf")
    .S3method("print", "sf", sf:::print.sf)
    on.exit(.S3method("print", "sf", cur_sf_method), add = TRUE)
  }
  print(df)
}


