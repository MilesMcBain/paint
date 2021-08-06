#' @export
unpaint <- function(df = .Last.value) {


  cur_data.frame_method <- getS3method("print", "data.frame")
  .S3method("print", "data.frame", base::print.data.frame)
  on.exit(.S3method("print", "data.frame", cur_data.frame_method), add = TRUE)

  if (isNamespaceLoaded("tibble")) {
    cur_tibble_method <- getS3method("print", "tbl_df")
    .S3method("print", "tbl_df", tibble:::print.tbl_df)
    on.exit(.S3method("print", "tbl_df", cur_tibble_method), add = TRUE)
  }
  if (isNamespaceLoaded("data.table")) {
    cur_data.table_method <- getS3method("print", "data.table")
    .S3method("print", "data.table", data.table:::print.data.table)
    on.exit(.S3method("print", "data.table", cur_data.table_method), add = TRUE)
  }
  if (isNamespaceLoaded("sf")) {
    cur_sf_method <- getS3method("print", "sf")
    .S3method("print", "sf", sf:::print.sf)
    on.exit(.S3method("print", "sf", cur_sf_method), add = TRUE)
  }
  print(df)
}


