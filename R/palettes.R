
#' @title paintpals
#' @rdname paintpals
#' @export
rainbow_6 <- function() {
  list(
    crayon::red,
    crayon::yellow,
    crayon::cyan,
    crayon::green,
    crayon::magenta,
    crayon::blue
  )
}
#' @rdname paintpals
#' @export
viridis_6 <- function() lapply(viridisLite::viridis(6), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_set3_12 <-
  function() lapply(RColorBrewer::brewer.pal(12, name = "Set3"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_pastel1_8 <-
  function() lapply(RColorBrewer::brewer.pal(8, name = "Pastel1"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_pastel2_7 <-
  function() lapply(RColorBrewer::brewer.pal(7, name = "Pastel2"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_dark2_7 <-
  function() lapply(RColorBrewer::brewer.pal(7, name = "Dark2"), crayon::make_style)

#' @rdname paintpals
#' @export
brewer_accent_7 <-
  function() lapply(RColorBrewer::brewer.pal(7, name = "Accent"), crayon::make_style)

