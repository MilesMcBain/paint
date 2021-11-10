test_that("data.table", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {
      pp_dt <- data.table::as.data.table(palmerpenguins::penguins)
      expect_snapshot(paint(pp_dt))
      pp_dt_keyed <- data.table::setkey(pp_dt, body_mass_g, flipper_length_mm)
      expect_snapshot(paint(pp_dt_keyed))
      expect_snapshot(paint(data.table::data.table()))
    }
  )
})
