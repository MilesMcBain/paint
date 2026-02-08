test_that("list column edge cases are handled", {

  # inspired by output from jsonlite::fromJSON
  null_in_list_cols <- tibble::tibble(
    col1 = c(1, 2, 3),
    col2 = list(NULL, NULL, list(arg = "text"))
  )


  expect_snapshot(paint::paint(null_in_list_cols))


})
