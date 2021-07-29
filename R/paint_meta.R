#' @export
paint_meta <- function(df) UseMethod("paint_meta")

#' @export
paint_meta.default <- function(df) NULL

#' @export
paint_meta.rowwise_df <- function(df) {
  flag <- "rowwise"
  groups <- setdiff(names(dplyr::group_data(df)), ".rows")
  if (length(groups) > 0) flag <- paste(flag, "grouped by:")
  flag_painted <- crayon::bgRed(flag)
  groups_painted <- crayon::silver(paste(groups, collapse = ", "))
  paste(flag_painted, groups_painted)
}

paint_meta.grouped_df <- function(df) {
  group_data <- dplyr::group_data(df)
  flag <- "grouped by:"
  groups <- setdiff(names(group_data), ".rows")
  n_groups <- nrow(group_data)
  flag_painted <- crayon::bgRed(flag)
  groups_painted <- crayon::silver(paste(groups, collapse = ", "))
  n_groups_painted <- crayon::silver(paste0("[", n_groups, "]")) 
  paste(flag_painted, groups_painted, n_groups_painted)
}

#' @export
paint_meta.sf <- function(df) {

}

is_rowwise <- function(x) inherits(x, "rowwise_df")
