test_that("paint options", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    paint_mask_print = NULL,
    .expr = {
      test_df <-
        data.frame(
          elems = seq(10),
          elems2 = seq(10) * 10^3,
          elems_long_name_3 = seq(10) * 10^6
        )
      expect_snapshot(capture.output(paint(test_df)))

      expect_snapshot(capture.output(paint(test_df)))
      options(paint_n_rows = 1)
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_n_rows = 6)
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_n_rows = 10)
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_n_rows = NULL)

      options(paint_palette = paint::brewer_set3_12())
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_max_width = Inf)
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_max_width = -1)
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_palette = NULL)
      options(paint_max_width = NULL)

      options(paint_align_row_head = "right")
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_align_row_head = "center")
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_align_row_head = NULL)

      options(paint_dark_mode = TRUE)
      expect_snapshot(capture.output(paint(test_df)))
      options(paint_dark_mode = NULL)
    }
  )
})