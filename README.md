
<!-- README.md is generated from README.Rmd. Please edit that file -->

# paint

<!-- badges: start -->

<!-- badges: end -->

An artisanally crafted set of print methods for `data.frame` family
rectangles.

## Installation

``` r
remotes::install_github("milesmcbain/paint")
```

## Example

``` r
library(paint)
#> Registered S3 method overwritten by 'paint':
#>   method           from
#>   print.data.frame base
mtcars
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
