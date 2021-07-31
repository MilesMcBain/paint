#' @export
paint_meta <- function(df, ...) UseMethod("paint_meta")

#' @export
paint_meta.default <- function(df, ...) NULL

#' @export
paint_meta.tbl_df <- function(df, incoming = NULL) {
  output <- incoming
  output
}

#' @export
paint_meta.rowwise_df <- function(df, incoming = NULL) {
  flag <- "rowwise"
  groups <- setdiff(names(dplyr::group_data(df)), ".rows")
  if (length(groups) > 0) flag <- paste(flag, "grouped by:")
  flag_painted <- crayon::bgRed(flag)
  groups_painted <- crayon::silver(paste(groups, collapse = ", "))
  output <- paste(flag_painted, groups_painted)
  if (!is.null(incoming)) output <- paste0(incoming, "\n", output)
  incoming <- output
  NextMethod(incoming = incoming) # fall through to tbl_df or tbl_ts
}

#' @export
paint_meta.grouped_df <- function(df, incoming = NULL) {
  group_data <- dplyr::group_data(df)
  flag <- "grouped by:"
  groups <- setdiff(names(group_data), ".rows")
  n_groups <- nrow(group_data)
  flag_painted <- crayon::bgRed(flag)
  groups_painted <- crayon::silver(paste(groups, collapse = ", "))
  n_groups_painted <- crayon::silver(paste0("[", n_groups, "]"))
  output <- paste(flag_painted, groups_painted, n_groups_painted)
  if (!is.null(incoming)) output <- paste0(incoming, "\n", output)
  incoming <- output
  NextMethod(incoming = incoming) # fall through to tbl_df or tbl_ts
}

#' @export
paint_meta.sf <- function(df) {
  geometry_column <- attr(df, "sf_column")
  geometry_column_type <- as.character(unique(sf::st_geometry_type(df))) # could be more than 1
  crs_code <- sf::st_crs(df)$epsg
  crs_name <- sf::st_crs(df)$Name
  crs_units <- sf::st_crs(df)$units_gdal

  crs_string <- if (!is.na(crs_code)) crs_code else NULL
  if (!is.na(crs_name)) crs_string <- paste(crs_string, paste0("(", crs_name, ")"))
  if (length(crs_string) == 0) {
    crs_string <- if (!is.na(st_crs(df)$wkt)) "custom WKT" else NA
  }
  geometry_column_type_string <- paste0("(", paste0(geometry_column_type, collapse = ", "), ")")
  geometry_column_string <- paste(geometry_column, geometry_column_type_string)

  meta_string <-
    paste0(
      "active geometry column: ",
      geometry_column_string,
      "\n",
      "crs: ",
      red_if_na(crs_string),
      "\n",
      "crs unit: ",
      red_if_na(crs_units)
    )
  crayon::silver(meta_string)
}

#' @export
paint_meta.data.table <- function(df) {

  sorted <- data.table::key(df)
  if (!is.null(sorted)) {
    crayon::silver(paste("keys:", paste0(sorted, collapse = ", ")))
  } else {
    NULL
  }
}

#' @export
paint_meta.tbl_ts <- function(df, incoming = NULL) {
  key <- tsibble::key(df)
  index <- tsibble::index(df)
  interval <-
    if (tsibble::is_regular(df)) format(tsibble::interval(df)) else "irregular"

  meta_data <-
    crayon::silver(
      paste0(
        "key: ",
        key,
        "\n",
        "index: ",
        index,
        " [",
        interval,
        "]"
      )
    )
  incoming <- if (!is.null(incoming)) {
    paste0(
      incoming,
      "\n",
      meta_data
    )
  } else {
    meta_data
  }
  NextMethod(incoming = incoming) # fall through to tbl_df
}

is_rowwise <- function(x) inherits(x, "rowwise_df")
null_if_na <- function(x) if (is.na(x)) NULL else x
red_if_na <- function(x) if (is.na(x)) crayon::red$inverse(x) else x
