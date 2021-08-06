test_that("multiplication works", {
 rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    paint_mask_print = NULL,
    .expr = {
  expect_snapshot(paint(tsibble::pedestrian))
  expect_snapshot(paint(dplyr::group_by(tsibble::pedestrian, Sensor)))
  expect_snapshot(paint(tsibble::group_by_key(tsibble::pedestrian)))
  expect_snapshot(paint(
    tsibble::as_tsibble(tsibble::pedestrian, regular = FALSE)
  ))
    })
})
