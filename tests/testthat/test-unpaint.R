test_that("unpaint", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {

      mask_print()

      expect_snapshot(unpaint(
        sf::st_as_sf(
          tibble::as_tibble(spData::nz)
        )
      ))

      expect_snapshot(
        unpaint(data.table::as.data.table(spData::nz))
      )
      unmask_print()
    }
  )
})
