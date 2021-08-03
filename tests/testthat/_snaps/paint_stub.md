# paint_stub

    Code
      paint_stub(letters)
    Output
      [1] "\033[90m[26]\033[39m"

---

    Code
      paint_stub(matrix(data = seq(9), nrow = 3))
    Output
      [1] "\033[90m[3, 3]\033[39m"

---

    Code
      paint_stub(array(data = rep(0, 10000), dim = c(10, 10, 10, 10)))
    Output
      [1] "\033[90m[10, 10, 10, 10]\033[39m"

---

    Code
      paint_stub(t(seq(10)))
    Output
      [1] "\033[90m[1, 10]\033[39m"

---

    Code
      paint_stub(seq(10))
    Output
      [1] "\033[90m[10]\033[39m"

---

    Code
      paint_stub(spData::nz)
    Output
      [1] "\033[90m[16, 7]\033[39m"

---

    Code
      paint_stub(sf::st_geometry(spData::nz))
    Output
      [1] "\033[90m[16, 1]\033[39m"

---

    Code
      paint_stub(palmerpenguins::penguins)
    Output
      [1] "\033[90m[344, 8]\033[39m"

---

    Code
      paint_stub(list(1, 2, 3))
    Output
      [1] "\033[90m[3]\033[39m"

---

    Code
      paint_stub(tibble::tibble(a = 1))
    Output
      [1] "\033[90m[1, 1]\033[39m"

---

    Code
      paint_stub(c(NA, NA, 1))
    Output
      [1] "\033[90m[3]\033[39m"

