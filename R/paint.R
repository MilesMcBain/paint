#' @export
paint <- function(object, ...) UseMethod("paint", object)


#' @export
paint.data.frame <- function(
  df,
  name = NULL,
  palette = getOption("paint_palette", rainbow_6()  )
) {
  col_types <- lapply(df, paint_col_type)
  col_names <- colnames(df)
  col_dims <- lapply(df, dim)
  cols <- mapply(
    paint_col,
    head(df, getOption("paint_n_rows", length(palette))),
    col_dims,
    MoreArgs = list(palette = palette)
  )
  if (getOption("paint_align_row_head", "unset") != "none") {
    col_names <- align_str(col_names)
    col_types <- align_str(col_types)
  }
  col_lines <- paste0(col_names, " ", col_types, " ", cols)
  cropped_lines <- crop_lines(col_lines, getOption("paint_max_width", 60))
  col_block <- paste0(
    sanitise_text(cropped_lines),
    collapse = "\n"
  )
  name <- paint_name(name)
  header <- trimws(paste(name, paint_head(df))) # the name is used for nested data.frames
  meta <- paint_meta(df)
  cat(header, "\n")
  if (!is.null(meta)) cat(meta, "\n")
  cat(col_block, "\n")
  # paint nested data frames
  nested_data_frame_idxs <- which(trimws(crayon::strip_style(col_types)) == "df")
  lapply(
    nested_data_frame_idxs,
    function(idx) {
      cat("\n")
      paint(df[[idx]], name = names(df)[idx], palette = palette)
    }
  )
  invisible()
}



function() {
  library(conflicted)
  library(paint)
  library(nycflights13)
  library(tidyverse)
  library(sf)
  library(data.table)
  library(spData)
  library(spDataLarge)
  options(paint_palette = brewer_pastel2_7())
  options(paint_palette = brewer_set3_12())
  options(paint_dark_mode = FALSE)
  options(paint_palette = viridis_6())
  options(paint_palette = rainbow_6())
  options(paint_palette = brewer_accent_7())
  options(paint_align_metadata = "right")
  paint(as.data.frame(flights))
  paint(flights)
  paint(as.data.table(flights))
  paint(mtcars)
  paint(iris)
  paint(data.frame(
    cool = c("a", NA, "c"),
    stuff = c(1, 2, 3)
  ))

  iris %>%
    nest(cols = starts_with("Sepal")) %>%
    paint()

  iris %>%
    mutate(
      nested_tibble = iris
    ) %>%
    paint()

  tst <- mtcars %>%
    mutate(
      mtcars_mat = as.matrix(mtcars)
    )

  tst1 <-
    tibble(
      this = c(NA, NaN, 3),
      that = list(
        matrix(rep(1, 4), nrow = 2),
        array(rep(1, 3), dim = c(3, 3, 3)),
        NULL
      ),
      more = list(NA, Inf, character(100)),
      and_more = c(1, -Inf, Inf),
      tibbles = list(tibble(col = "a"), NULL, tibble(col = "c"))
    )

  dplyr::filter(tst1, !is.na(tibbles))


  tst1 %>%
    mutate(
      nested_tibble = as_tibble(tst1)
    ) %>%
    paint()
  
  tst2 <- tibble(
    col = "data",
    null = NULL
  ) 
  paint(tst2)

  flights %>%
    group_by(year, month) %>%
    paint()

  flights %>%
    group_by(year, month) %>%
    rowwise() %>%
    paint()


  flights %>%
    rowwise() %>%
    paint()
  
  options(paint_max_width = Inf, paint_n_rows = 7)
  nz %>%
    paint()

  tst <- nz
  st_crs(tst) <- NA_crs_
  paint(tst)

  paint(nz)
  paint(flights)

  tibble(
    thing = list(tibble(a = 1, b = 2), tibble(a = 3, b = 4))
  )

  

  # data.table
  flights <- "https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv"
  fdt <- fread(flights)
  ans <- fdt[
    carrier == "AA",
    .(mean(arr_delay), mean(dep_delay)),
    keyby = .(origin, dest, month)
  ]
  paint(ans)

  tibble(
    text = c("word", "line\nbreak", "word"),
    numbers = c(1, 2, 3)
  ) %>% paint()
 
  # tsibble
  library(tsibble)
  weather <- nycflights13::weather %>% 
  select(origin, time_hour, temp, humid, precip)
  weather

  weather_tsbl <- as_tsibble(weather, key = origin)
  weather_tsbl
  weather_tsbl %>%
    group_by(precip)


  # vectors
  library(vctrs)
  latlon <- function(lat, lon) {
  new_rcrd(list(lat = lat, lon = lon), class = "earth_latlon")
}

#' @export
format.earth_latlon <- function(x, ..., formatter = deg_min) {
  x_valid <- which(!is.na(x))

  lat <- field(x, "lat")[x_valid]
  lon <- field(x, "lon")[x_valid]

  ret <- rep(NA_character_, vec_size(x))
  ret[x_valid] <- paste0(formatter(lat, "lat"), " ", formatter(lon, "lon"))
  # It's important to keep NA in the vector!
  ret
}

deg_min <- function(x, direction) {
  pm <- if (direction == "lat") c("N", "S") else c("E", "W")

  sign <- sign(x)
  x <- abs(x)
  deg <- trunc(x)
  x <- x - deg
  min <- round(x * 60)

  # Ensure the columns are always the same width so they line up nicely
  ret <- sprintf("%d°%.2d'%s", deg, min, ifelse(sign >= 0, pm[[1]], pm[[2]]))
  format(ret, justify = "right")
}

tibble(coords = latlon(c(32.71, 2.95, NA), c(-117.17, 1.67, NA))) 
}

