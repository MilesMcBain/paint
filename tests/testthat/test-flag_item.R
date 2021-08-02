test_that("flag_item", {
  
  expect_error(flag_item(c(1,2,NA)), regexp = "You gave me an item of length > 1 to flag")

  expect_true(flag_item(NULL))
  expect_false(flag_item(character(0)))
  expect_true(flag_item(Inf))
  expect_true(flag_item(NA))
  expect_true(flag_item(NaN))
})
