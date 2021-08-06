test_that("tibble", {
  rlang::with_options(
    cli.num_colors = 256,
    paint_n_rows = NULL,
    paint_max_width = NULL,
    paint_palette = NULL,
    paint_align_row_head = NULL,
    paint_dark_mode = NULL,
    .expr = {
      expect_snapshot(paint(tibble::tibble(foo = list(character(0)))))

      tst1 <-
        tibble::tibble(
          this = c(NA, NaN, 3),
          that = list(
            matrix(rep(1, 4), nrow = 2),
            array(rep(1, 3), dim = c(3, 3, 3)),
            NULL
          ),
          more = list(NA, Inf, character(100)),
          and_more = c(1, -Inf, Inf),
          tibbles = list(tibble::tibble(col = "a"), NULL, tibble::tibble(col = "c"))
        )
      expect_snapshot(paint(tst1))

      nested_penguins <-
        tidyr::nest(palmerpenguins::penguins, cols = starts_with("bill"))
      expect_snapshot(paint(nested_penguins))

      nested_matrix <-
        dplyr::mutate(
          tibble::as_tibble(mtcars),
          mtcars_mat = as.matrix(mtcars)
        )
      expect_snapshot(paint(nested_matrix))

      nested_tibble <-
        dplyr::mutate(
          tibble::as_tibble(mtcars),
          mtcars_mat = tibble::as_tibble(mtcars)
        )
      expect_snapshot(paint(nested_tibble))

      grouped_tibble <-
        dplyr::group_by(
          palmerpenguins::penguins,
          year,
          sex,
          island,
          species
        )
      expect_snapshot(paint(grouped_tibble))

      expect_snapshot(paint(dplyr::rowwise(grouped_tibble)))

      expect_snapshot(paint(dplyr::rowwise(palmerpenguins::penguins)))

      # vctrs
      library(vctrs) # have to library it in or S3 won't register
      new_percent <- function(x = double()) {
        vctrs::vec_assert(x, double())
        vctrs::new_vctr(x, class = "percent")
      }
      vec_ptype_abbr.percent <- function(x) {
        "pct%"
      }
      # needed to register the S3 method in a test

      format.percent <- function(x) {
        paste0(format(as.numeric(vctrs::vec_data(x)) * 100, digits = 3), "%")
      }
      a_vctr <- new_percent(c(seq(0, 1, length.out = 4), NA))

      vec_tibble <- tibble::tibble(
        vctr = a_vctr,
        nums = seq_along(a_vctr)
      )
      expect_snapshot(paint(vec_tibble))
    }
  )
})
