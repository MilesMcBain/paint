test_that("multiplication works", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {
      expect_snapshot(paint(tsibble::pedestrian))
      expect_snapshot(paint(dplyr::group_by(tsibble::pedestrian, Sensor)))
      expect_snapshot(paint(tsibble::group_by_key(tsibble::pedestrian)))
      expect_snapshot(paint(
        tsibble::as_tsibble(tsibble::pedestrian, regular = FALSE)
      ))
    }
  )

  flights <-
    nycflights13::flights |>
    head() |>
    mutate(
      sched_dep_datetime =
        make_datetime(year, month, day, hour, minute, tz = "America/New_York")
    )

  flights_tsbl <- flights %>%
    as_tsibble(
      key = c(carrier, flight),
      index = sched_dep_datetime,
      regular = FALSE
    )

  expect_snapshot(
    paint(flights_tsbl)
  )

})
