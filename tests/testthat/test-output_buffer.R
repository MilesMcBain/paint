test_that("ouput_buffer works", {
  reset_output_buffer()
  expect_null(
    get_output_buffer()
  )

  append_to_output_buffer("a", "b", "c")
  expect_equal(
    get_output_buffer(),
    c("a", "b", "c")
  )
  reset_output_buffer()

  append_to_output_buffer("a\nb\nc", "1", "2", "3")
  expect_equal(
    get_output_buffer_rows(),
    3
  )
  reset_output_buffer()

  expect_snapshot(
    { 
      paint_to_output_buffer(mtcars)
      get_output_buffer()
    })
})
