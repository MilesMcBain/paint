test_that("invalid encodings are handled", {
df <- data.frame(
    bad = "23\xbfC",
    good = "dummy",
    the_worst = "2015 President and Vice-Chancellor\x92s Alumni Scholarship Appeal"
  )

  expect_snapshot(paint(df))
})
