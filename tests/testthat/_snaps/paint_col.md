# paint_col

    Code
      paint_col(head(letters), palette = rainbow_6())
    Output
      [1] "\033[31ma\033[39m \033[33mb\033[39m \033[36mc\033[39m \033[32md\033[39m \033[35me\033[39m \033[34mf\033[39m"

---

    Code
      paint_col(seq(1:6), palette = rainbow_6())
    Output
      [1] "\033[31m1\033[39m \033[33m2\033[39m \033[36m3\033[39m \033[32m4\033[39m \033[35m5\033[39m \033[34m6\033[39m"

---

    Code
      paint_col(rep(TRUE, 6), palette = rainbow_6())
    Output
      [1] "\033[31mTRUE\033[39m \033[33mTRUE\033[39m \033[36mTRUE\033[39m \033[32mTRUE\033[39m \033[35mTRUE\033[39m \033[34mTRUE\033[39m"

---

    Code
      paint_col(c(1, NA, NaN), palette = rainbow_6())
    Output
      [1] "\033[31m1\033[39m \033[33m\033[7mNA\033[27m\033[39m \033[36m\033[7mNaN\033[27m\033[39m"

---

    Code
      paint_col(c(1.1234567, 2.123, NA, NaN, 0.1234567), palette = rainbow_6())
    Output
      [1] "\033[31m1.123457\033[39m \033[33m2.123\033[39m \033[36m\033[7mNA\033[27m\033[39m \033[32m\033[7mNaN\033[27m\033[39m \033[35m0.123457\033[39m"

---

    Code
      paint_col(head(palmerpenguins::penguins), dim = dim(palmerpenguins::penguins),
      palette = rainbow_6())
    Output
      [1] "\033[90mtibble [344, 8]\033[39m"

---

    Code
      paint_col(head(sf::st_geometry(spData::nz)), palette = rainbow_6())
    Output
      [1] "\033[31mMPOLY 1,784B\033[39m \033[33mMPOLY 2,288B\033[39m \033[36mMPOLY 2,376B\033[39m \033[32mMPOLY 1,800B\033[39m \033[35mMPOLY 1,416B\033[39m \033[34mMPOLY 1,848B\033[39m"

---

    Code
      paint_col(list(tibble::tibble(col1 = c(1, 2), col2 = c(3, 4)), tibble::tibble(
        foo = list(character(0))), data.table::as.data.table(palmerpenguins::penguins),
      tsibble::pedestrian, head(sf::st_geometry(spData::nz)), spData::nz, a_vctr,
      letters, as.list(letters), NULL, NA, Inf, logical(0), as.matrix(mtcars), array(
        1:27, dim = c(3, 3, 3))), palette = rainbow_6())
    Output
      [1] "\033[31mtibble [2, 2]\033[39m \033[33mtibble [1, 1]\033[39m \033[36mdata.table [344, 8]\033[39m \033[32mtsibble [66037, 5]\033[39m \033[35msfc_MULTIPOLYGON [6, 1]\033[39m \033[34msf [16, 7]\033[39m \033[31mpct% [5, 1]\033[39m \033[33mcharacter [26]\033[39m \033[36mlist [26]\033[39m \033[32m\033[7mNULL\033[27m\033[39m \033[35m\033[7mNA\033[27m\033[39m \033[34m\033[7mInf\033[27m\033[39m \033[31mlogical [0]\033[39m \033[33mmatrix [32, 11]\033[39m \033[36marray [3, 3, 3]\033[39m"

