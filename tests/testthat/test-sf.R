test_that("sf", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    paint_mask_print = NULL,
    .expr = {
      expect_snapshot(paint(spData::nz))
      expect_snapshot(paint(
        sf::st_as_sf(
          tibble::as_tibble(spData::nz)
        )
      ))
      expect_snapshot(paint(spData::seine))

      tnz <- spData::nz
      sf::st_crs(tnz) <- sf::NA_crs_
      expect_snapshot(paint(tnz))

      tst_sf <- tibble::tibble(
        num = c(1, 2, 3),
        geom = sf::st_sfc(
          sf::st_point(c(1, 1)),
          sf::st_linestring(matrix(seq(4), nrow = 2)),
          tnz$geom[[1]]
        )
      )
      expect_snapshot(paint(sf::st_as_sf(tst_sf)))

      grouped_nz <-
        spData::nz %>%
        dplyr::group_by(Island)
      expect_snapshot(paint(grouped_nz))

    }
  )
})
