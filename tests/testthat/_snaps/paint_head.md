# paint_head

    Code
      paint_head(tibble::tibble(a = 1))
    Output
      [1] "\033[90mtibble\033[39m \033[90m[1, 1]\033[39m"

---

    Code
      paint_head(tibble::as_tibble(mtcars))
    Output
      [1] "\033[90mtibble\033[39m \033[90m[32, 11]\033[39m"

---

    Code
      paint_head(tibble::tibble())
    Output
      [1] "\033[90mtibble\033[39m \033[90m[0, 0]\033[39m"

---

    Code
      paint_head(tibble::tibble(col1 = list(), col2 = list()))
    Output
      [1] "\033[90mtibble\033[39m \033[90m[0, 2]\033[39m"

---

    Code
      paint_head(mtcars)
    Output
      [1] "\033[90mdata.frame\033[39m \033[90m[32, 11]\033[39m"

---

    Code
      paint_head(nested_cars)
    Output
      [1] "\033[90mtibble\033[39m \033[90m[32, 12]\033[39m"

---

    Code
      paint_head(tsibble::pedestrian)
    Output
      [1] "\033[90mtsibble\033[39m \033[90m[66037, 5]\033[39m"

---

    Code
      paint_head(spData::nz)
    Output
      [1] "\033[90msf\033[39m \033[90m[16, 7]\033[39m"

---

    Code
      paint_head(data.table::as.data.table(mtcars))
    Output
      [1] "\033[90mdata.table\033[39m \033[90m[32, 11]\033[39m"

---

    Code
      paint_head(sf::st_geometry(spData::nz)[[1]])
    Output
      [1] "\033[90mMPOLY\033[39m \033[90m1,784B\033[39m"

---

    Code
      paint_head(sf::st_geometry(spData::cycle_hire)[[1]])
    Output
      [1] "\033[90mPOINT\033[39m \033[90m424B\033[39m"

---

    Code
      paint_head(sf::st_geometry(spData::seine)[[1]])
    Output
      [1] "\033[90mMLINES\033[39m \033[90m3,440B\033[39m"

---

    Code
      paint_head(sf::st_geometry(spData::nz))
    Output
      [1] "\033[90msfc_MULTIPOLYGON\033[39m \033[90m[16, 1]\033[39m"

---

    Code
      paint_head(sf::st_geometry(spData::cycle_hire))
    Output
      [1] "\033[90msfc_POINT\033[39m \033[90m[742, 1]\033[39m"

---

    Code
      paint_head(sf::st_geometry(spData::seine))
    Output
      [1] "\033[90msfc_MULTILINESTRING\033[39m \033[90m[3, 1]\033[39m"

---

    Code
      paint_head(letters)
    Output
      [1] "\033[90mcharacter\033[39m \033[90m[26]\033[39m"

---

    Code
      paint_head(as.list(letters))
    Output
      [1] "\033[90mlist\033[39m \033[90m[26]\033[39m"

---

    Code
      paint_head(matrix(data = seq(9), nrow = 3))
    Output
      [1] "\033[90mmatrix\033[39m \033[90m[3, 3]\033[39m"

---

    Code
      paint_head(array(data = rep(0, 10000), dim = c(10, 10, 10, 10)))
    Output
      [1] "\033[90marray\033[39m \033[90m[10, 10, 10, 10]\033[39m"

---

    Code
      paint_head(t(seq(10)))
    Output
      [1] "\033[90mmatrix\033[39m \033[90m[1, 10]\033[39m"

---

    Code
      paint_head(seq(10))
    Output
      [1] "\033[90minteger\033[39m \033[90m[10]\033[39m"

---

    Code
      paint_head(list())
    Output
      [1] "\033[90mlist\033[39m \033[90m[0]\033[39m"

---

    Code
      paint_head(c(NA, NA, 1))
    Output
      [1] "\033[90mnumeric\033[39m \033[90m[3]\033[39m"

---

    Code
      paint_head(character(0))
    Output
      [1] "\033[90mcharacter\033[39m \033[90m[0]\033[39m"

---

    Code
      paint_head(new_percent(c(seq(0, 1, length.out = 4), NA)))
    Output
      [1] "\033[90mpct%\033[39m \033[90m[5, 1]\033[39m"

