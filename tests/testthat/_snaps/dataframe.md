# data.frame types

    Code
      paint(data.frame(cool = c("a", NA, "c"), stuff = c(1, -Inf, Inf)))
    Output
      [90mdata.frame[39m [90m[3, 2][39m
      cool  [90mchr[39m [31ma[39m [33m[7mNA[27m[39m [36mc[39m
      stuff [90mdbl[39m [31m1[39m [33m[7m-Inf[27m[39m [36m[7mInf[27m[39m

---

    Code
      paint(data.frame(chr_col = c("a", "b", "c"), raw_col = unlist(lapply(c("a", "b",
        "c"), charToRaw)), int_col = c(1L, 2L, 3L), dbl_col = c(1, 2, 3),
      datetime_col = as.POSIXct(c("2013-01-01 05:00:00 EST",
        "2013-01-01 05:00:00 EST", "2013-01-01 05:00:00 EST")), complex_col = c(0 +
        0+1i, 1 + 0+2i, 2 + 0+3i)))
    Output
      [90mdata.frame[39m [90m[3, 6][39m
      chr_col      [90mchr[39m  [31ma[39m [33mb[39m [36mc[39m
      raw_col      [90mraw[39m  [31m61[39m [33m62[39m [36m63[39m
      int_col      [90mint[39m  [31m1[39m [33m2[39m [36m3[39m
      dbl_col      [90mdbl[39m  [31m1[39m [33m2[39m [36m3[39m
      datetime_col [90mdttm[39m [31m2013-01-01 05:00:00[39m [33m2013-01-01 05:00:00[39m [36m2[39m[1m~[22m
      complex_col  [90mcplx[39m [31m0+1i[39m [33m1+2i[39m [36m2+3i[39m

---

    Code
      paint(data.frame())
    Output
      [90mdata.frame[39m [90m[0, 0][39m

