#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param name
#' @return
#' @author Miles McBain
paint_name <- function(name) {

  if (is.null(name)) return(NULL)
  crayon::bold$silver(name)

}
