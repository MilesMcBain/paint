test_that("paint_head", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {

      # rectangles
      expect_snapshot(paint_head(tibble::tibble(a = 1)))
      expect_snapshot(paint_head(tibble::as_tibble(mtcars)))
      expect_snapshot(paint_head(tibble::tibble()))
      expect_snapshot(paint_head(tibble::tibble(col1 = list(), col2 = list())))
      expect_snapshot(paint_head(mtcars))
      nested_cars <-
        mtcars %>%
        tibble::as_tibble() %>%
        dplyr::mutate(
          nested_df = mtcars
        )
      expect_snapshot(paint_head(nested_cars))
      expect_snapshot(paint_head(tsibble::pedestrian))
      expect_snapshot(paint_head(spData::nz))
      expect_snapshot(paint_head(data.table::as.data.table(mtcars)))

      # row elements
      expect_snapshot(paint_head(sf::st_geometry(spData::nz)[[1]]))
      expect_snapshot(paint_head(sf::st_geometry(spData::cycle_hire)[[1]]))
      expect_snapshot(paint_head(sf::st_geometry(spData::seine)[[1]]))
      expect_snapshot(paint_head(sf::st_geometry(spData::nz)))
      expect_snapshot(paint_head(sf::st_geometry(spData::cycle_hire)))
      expect_snapshot(paint_head(sf::st_geometry(spData::seine)))
      expect_snapshot(paint_head(letters))
      expect_snapshot(paint_head(as.list(letters)))
      expect_snapshot(paint_head(matrix(data = seq(9), nrow = 3)))
      expect_snapshot(paint_head(array(data = rep(0, 10000), dim = c(10, 10, 10, 10))))
      expect_snapshot(paint_head(t(seq(10))))
      expect_snapshot(paint_head(seq(10)))
      expect_error(paint_head(NULL), "paint_head got passed NULL")
      expect_error(paint_head(NA), "paint_head got passed NA")
      expect_error(paint_head(Inf), "paint_head got passed an infinite")
      expect_snapshot(paint_head(list()))
      expect_snapshot(paint_head(c(NA, NA, 1)))
      expect_snapshot(paint_head(character(0)))

      # vctrs
      new_percent <- function(x = double()) {
        vctrs::vec_assert(x, double())
        vctrs::new_vctr(x, class = "percent")
      }
      vec_ptype_abbr.percent <- function(x) {
        "pct%"
      }
      expect_snapshot(paint_head(new_percent(c(seq(0, 1, length.out = 4), NA))))
    }
  )
})
