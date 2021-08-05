#' @export
unpaint <- function(df = .Last.value) {

  cur_data.frame_method <- getS3method("print", "data.frame")
  cur_tibble_method <- getS3method("print", "tbl_df")
  cur_sf_method <- getS3method("print", "sf")
  cur_data.table_method <- getS3method("print", "data.table")

  .S3method("print", "data.frame", base::print.data.frame)
  if (isNamespaceLoaded("tibble")) {
    .S3method("print", "tbl_df", tibble:::print.tbl_df)
  }
  if (isNamespaceLoaded("data.table")) {
    .S3method("print", "data.table", data.table:::print.data.table)
  }
  if (isNamespaceLoaded("sf")) {
    .S3method("print", "sf", sf:::print.sf)
  }
  on.exit({
    .S3method("print", "data.frame", cur_data.frame_method)
    .S3method("print", "tbl_df", cur_tibble_method)
    .S3method("print", "data.table", cur_data.table_method)
    .S3method("print", "sf", cur_sf_method)
  })
  print(df)
  
}

function() {
  spData::nz %>%
  tibble::as_tibble() %>%
  sf::st_as_sf()
  unpaint()

  spData::nz %>%
  data.table::as.data.table() 
  unpaint()
}
