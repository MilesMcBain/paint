test_that("flag_item", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {
  expect_error(flag_item(c(1,2,NA)), regexp = "You gave me an item of length > 1 to flag")

  expect_true(flag_item(NULL))
  expect_false(flag_item(character(0)))
  expect_true(flag_item(Inf))
  expect_true(flag_item(NA))
  expect_true(flag_item(NaN))
    })
})
