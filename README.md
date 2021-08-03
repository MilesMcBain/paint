
<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="inst/media/paint.png" width="100%" />

# paint

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

An artisanally crafted set of print methods for `data.frame` family
rectangles:

  - `data.frame`
  - tibble (`tbl_df`)
  - simple features geometry collection (`sf`)
  - `data.table`
  - tsibble (`tbl_ts`)

## Installation

``` r
remotes::install_github("milesmcbain/paint")
```

## Usage

### paint()

Call `paint()` on any compatible `data.frame`. Relevant metadata is
printed for each class.

``` r
library(spData)
library(paint)
paint(nz)
#> sf [16, 7] 
#> active geometry column: geom (MULTIPOLYGON)
#> crs: 2193 (NZGD2000 / New Zealand Transverse Mercator 2000)
#> crs unit: metre 
#> Name          chr Northland Auckland Waikato Bay of Plenty ~
#> Island        chr North North North North North North
#> Land_area     dbl 12500.561149 4941.572557 23900.036383 120~
#> Population    dbl 175500 1657200 460100 299900 48500 164000
#> Median_income int 23400 29600 27900 26200 24400 26100
#> Sex_ratio     dbl 0.942453 0.944286 0.95205 0.928039 0.9349~
#> geom          sfc MPOLY 1,784 B MPOLY 2,288 B MPOLY 2,376 B~
```

### Replacing `print()`

You can optionally replace the `print()` methods with `paint()` to paint
datafames any time they are output:

``` r
options(
  paint_mask_print = TRUE
)
library(paint)
#> {paint} masked print.data.frame
#> {paint} masked print.tbl_df
#> {paint} masked print.sf
library(tibble)
library(sf)
#> Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1
library(spData)
coffee_data
#> tibble [47, 3] 
#> name_long              chr Angola Bolivia Brazil Burundi Ca~
#> coffee_production_2016 int NA 3 3277 37 8 NA
#> coffee_production_2017 int NA 4 2786 38 6 NA
```

### unpaint()

While using `paint()` as your default `print()`, you can call the
original `print()` method with `unpaint()`:

``` r
unpaint(nz)
#> Simple feature collection with 16 features and 6 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 1090144 ymin: 4748537 xmax: 2089533 ymax: 6191874
#> Projected CRS: NZGD2000 / New Zealand Transverse Mercator 2000
#> First 10 features:
#>                 Name Island Land_area Population Median_income Sex_ratio
#> 1          Northland  North 12500.561     175500         23400 0.9424532
#> 2           Auckland  North  4941.573    1657200         29600 0.9442858
#> 3            Waikato  North 23900.036     460100         27900 0.9520500
#> 4      Bay of Plenty  North 12071.145     299900         26200 0.9280391
#> 5           Gisborne  North  8385.827      48500         24400 0.9349734
#> 6        Hawke's Bay  North 14137.524     164000         26100 0.9238375
#> 7           Taranaki  North  7254.480     118000         29100 0.9569363
#> 8  Manawatu-Wanganui  North 22220.608     234500         25000 0.9387734
#> 9         Wellington  North  8048.553     513900         32700 0.9335524
#> 10        West Coast  South 23245.456      32400         26900 1.0139072
#>                              geom
#> 1  MULTIPOLYGON (((1745493 600...
#> 2  MULTIPOLYGON (((1803822 590...
#> 3  MULTIPOLYGON (((1860345 585...
#> 4  MULTIPOLYGON (((2049387 583...
#> 5  MULTIPOLYGON (((2024489 567...
#> 6  MULTIPOLYGON (((2024489 567...
#> 7  MULTIPOLYGON (((1740438 571...
#> 8  MULTIPOLYGON (((1866732 566...
#> 9  MULTIPOLYGON (((1881590 548...
#> 10 MULTIPOLYGON (((1557042 531...
```

For convenience `unpaint()` it will call `print()` on `.LastValue` by
default if no argument is provided.

### Customising

Supported options:

  - `paint_palette` the palette to paint row colours with, defaults to
    `rainbow_6()`, 6 standard ANSI colours that are supported in most
    terminals.
  - `paint_n_rows` the number of rows to print for each column. Defaults
    to the number of colours in the `paint_palette`, but can be set
    higher for repeating sequences.
  - `paint_max_width` the maximum width of the output. 60 is the
    default. `{paint}` does not resize based on terminal width by
    design.
  - `paint_align_row_head = c("left", "center", "right")`. How to align
    the column title and type. Defaults to `"left"`.
  - `paint_dark_mode` darken the `paint_palette` using `crayon::blurred`
    - not supported in all terminals.
  - `paint_mask_print` mask the print() methods of supported dataframes
    in the `.Globalenv`? Defaults to `FALSE`.

### Making a custom palette

There are a number of built in palettes - see ?paintpals. Creating your
own palettes is matter of creating a list of `{crayon}` styles. These
can be created from hex colour codes e.g. `#8DD3C7`. A bit easier than
it sounds it practice:

``` r
library(viridisLite)
library(crayon)
my_magma <- lapply(viridisLite::magma(6), crayon::make_style)
options(paint_palette = my_magma)
paint(mtcars)
#> data.frame [32, 11] 
#> mpg  dbl 21 21 22.8 21.4 18.7 18.1
#> cyl  dbl 6 6 4 6 8 6
#> disp dbl 160 160 108 258 360 225
#> hp   dbl 110 110 93 110 175 105
#> drat dbl 3.9 3.9 3.85 3.08 3.15 2.76
#> wt   dbl 2.62 2.875 2.32 3.215 3.44 3.46
#> qsec dbl 16.46 17.02 18.61 19.44 17.02 20.22
#> vs   dbl 0 0 1 1 0 1
#> am   dbl 1 1 1 0 0 0
#> gear dbl 4 4 4 3 3 3
#> carb dbl 4 4 1 1 2 1
```

Colours are applied to rows in the order they appear in the palette. You
can also use more advanced `{crayon}` styles, but that is beyond the
scope of this document.

## Design

`{paint}` is a response to my frustrations with standard print methods
on large rectangles. It tries to be less noisy, harnessing the eye’s
ability to see colour patterns to reduce markup characters. Only the
most important information for data wrangling is highlighted, the
pinnacle being the column names, which always appear down the left and
are never truncated.

Important issues with the data, e.g. sticky `dplyr` groups, or missing
values, are highlighted to draw extra attention.

`{paint}` draws inspiration from
[`glimpse()`](https://github.com/r-lib/pillar/blob/master/R/glimpse.R),
`str()`, [`{emphatic}`](https://github.com/coolbutuseless/emphatic), and
the [Rainbow CSV](https://github.com/mechatroner/vscode_rainbow_csv)
addin for VScode.
