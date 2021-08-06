test_that("mask_print", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {

      options(paint_remind_mask_print = FALSE)
      mask_print()
      expect_snapshot(mtcars)
      expect_snapshot(palmerpenguins::penguins)
      expect_snapshot(spData::nz)
      expect_snapshot(data.table::as.data.table(palmerpenguins::penguins))
      unmask_print()
      expect_snapshot(mtcars)
      expect_snapshot(palmerpenguins::penguins)
      expect_snapshot(spData::nz)
      expect_snapshot(data.table::as.data.table(palmerpenguins::penguins))
    }
  )
})
