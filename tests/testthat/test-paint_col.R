test_that("paint_col", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {
      # vctrs
      vec_ptype_abbr <- vctrs::vec_ptype_abbr
      new_percent <- function(x = double()) {
        vctrs::vec_assert(x, double())
        vctrs::new_vctr(x, class = "percent")
      }
      vec_ptype_abbr.percent <- function(x) {
        "pct%"
      }
      .S3method("vec_ptype_abbr", "percent", vec_ptype_abbr.percent)
      a_vctr <- new_percent(c(seq(0, 1, length.out = 4), NA))

      expect_snapshot(paint_col(head(letters), palette = rainbow_6()))
      expect_snapshot(paint_col(seq(1:6), palette = rainbow_6()))
      expect_snapshot(paint_col(rep(TRUE, 6), palette = rainbow_6()))
      expect_snapshot(paint_col(c(1, NA, NaN), palette = rainbow_6()))
      expect_snapshot(paint_col(c(1.1234567, 2.123000, NA, NaN, .1234567), palette = rainbow_6()))
      expect_snapshot(
        paint_col(
          head(palmerpenguins::penguins),
          dim = dim(palmerpenguins::penguins),
          palette = rainbow_6()
        )
      )
      expect_snapshot(paint_col(head(sf::st_geometry(spData::nz)), palette = rainbow_6()))
      expect_snapshot(paint_col(
        list(
          tibble::tibble(col1 = c(1, 2), col2 = c(3, 4)),
          tibble::tibble(foo = list(character(0))),
          data.table::as.data.table(palmerpenguins::penguins),
          tsibble::pedestrian,
          head(sf::st_geometry(spData::nz)),
          spData::nz,
          a_vctr,
          letters,
          as.list(letters),
          NULL,
          NA,
          Inf,
          logical(0),
          as.matrix(mtcars),
          array(1:27, dim = c(3,3,3))
        ),
        palette = rainbow_6()
      ))
    }
  )
})
