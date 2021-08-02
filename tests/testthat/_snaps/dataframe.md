# data.frame types

    Code
      capture.output(paint(data.frame(cool = c("a", NA, "c"), stuff = c(1, -Inf, Inf))))
    Output
      [1] "\033[90mdata.frame\033[39m \033[90m[3, 2]\033[39m "                                                                 
      [2] "cool  \033[90mchr\033[39m \033[31ma\033[39m \033[33m\033[7mNA\033[27m\033[39m \033[36mc\033[39m"                    
      [3] "stuff \033[90mdbl\033[39m \033[31m1\033[39m \033[33m\033[7m-Inf\033[27m\033[39m \033[36m\033[7mInf\033[27m\033[39m "

---

    Code
      capture.output(paint(data.frame(chr_col = c("a", "b", "c"), raw_col = unlist(
        lapply(c("a", "b", "c"), charToRaw)), int_col = c(1L, 2L, 3L), dbl_col = c(1,
        2, 3), datetime_col = as.POSIXct(c("2013-01-01 05:00:00 EST",
        "2013-01-01 05:00:00 EST", "2013-01-01 05:00:00 EST")), complex_col = c(0 +
        0+1i, 1 + 0+2i, 2 + 0+3i))))
    Output
      [1] "\033[90mdata.frame\033[39m \033[90m[3, 6]\033[39m "                                                                                         
      [2] "chr_col      \033[90mchr\033[39m  \033[31ma\033[39m \033[33mb\033[39m \033[36mc\033[39m"                                                    
      [3] "raw_col      \033[90mraw\033[39m  \033[31m61\033[39m \033[33m62\033[39m \033[36m63\033[39m"                                                 
      [4] "int_col      \033[90mint\033[39m  \033[31m1\033[39m \033[33m2\033[39m \033[36m3\033[39m"                                                    
      [5] "dbl_col      \033[90mdbl\033[39m  \033[31m1\033[39m \033[33m2\033[39m \033[36m3\033[39m"                                                    
      [6] "datetime_col \033[90mdttm\033[39m \033[31m2013-01-01 05:00:00\033[39m \033[33m2013-01-01 05:00:00\033[39m \033[36m2\033[39m\033[1m~\033[22m"
      [7] "complex_col  \033[90mcplx\033[39m \033[31m0+1i\033[39m \033[33m1+2i\033[39m \033[36m2+3i\033[39m "                                          

