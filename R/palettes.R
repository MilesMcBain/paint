rainbow_6 <-
  list(
    crayon::red,
    crayon::yellow,
    crayon::cyan,
    crayon::green,
    crayon::magenta,
    crayon::blue
  )

viridis_6 <-
  lapply(viridisLite::viridis(6), crayon::make_style)

brewer_set3_12 <-
  lapply(RColorBrewer::brewer.pal(12, name = "Set3"), crayon::make_style)

brewer_pastel1_8 <-
  lapply(RColorBrewer::brewer.pal(8, name = "Pastel1"), crayon::make_style)

brewer_pastel2_7 <-
  lapply(RColorBrewer::brewer.pal(7, name = "Pastel2"), crayon::make_style)

brewer_dark2_7 <-
  lapply(RColorBrewer::brewer.pal(7, name = "Dark2"), crayon::make_style)

brewer_accent_7 <-
  lapply(RColorBrewer::brewer.pal(7, name = "Accent"), crayon::make_style)

