test_that("data.frame types", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    paint_mask_print = NULL,
    .expr = {
      expect_snapshot(
        capture.output(paint(data.frame(
          cool = c("a", NA, "c"),
          stuff = c(1, -Inf, Inf)
        )))
      )

			expect_snapshot(
			  capture.output(paint(
					data.frame(
					chr_col = c("a", "b", "c"),
					raw_col = unlist(lapply(c("a", "b", "c"), charToRaw)),
					int_col = c(1L, 2L, 3L),
					dbl_col = c(1,2,3),
					datetime_col = as.POSIXct(c("2013-01-01 05:00:00 EST", "2013-01-01 05:00:00 EST", "2013-01-01 05:00:00 EST")),
					complex_col = c(0+1i, 1+2i, 2+3i)
				))))
    })
	
})
