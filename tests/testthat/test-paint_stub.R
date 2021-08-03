test_that("paint_stub", {
rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    paint_mask_print = NULL,
    .expr = {
  expect_snapshot(paint_stub(letters))
  expect_snapshot(paint_stub(matrix(data = seq(9), nrow = 3)))
  expect_snapshot(paint_stub(array(data = rep(0, 10000), dim = c(10, 10, 10, 10))))
  expect_snapshot(paint_stub(t(seq(10))))
  expect_snapshot(paint_stub(seq(10)))
  expect_error(paint_stub(NULL), "paint_stub got passed NULL")
  expect_error(paint_stub(NA), "paint_stub got passed NA")
  expect_error(paint_stub(Inf), "paint_stub got passed an infinite")

  expect_snapshot(paint_stub(spData::nz))
  expect_snapshot(paint_stub(sf::st_geometry(spData::nz)))
  expect_snapshot(paint_stub(palmerpenguins::penguins))
  expect_snapshot(paint_stub(list(1, 2, 3)))
  expect_snapshot(paint_stub(tibble::tibble(a = 1)))
  expect_snapshot(paint_stub(c(NA, NA, 1)))
    })
})
