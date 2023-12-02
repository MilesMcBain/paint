# mask_print

    Code
      mtcars
    Output
      [90mdata.frame[39m [90m[32, 11][39m
      mpg  [90mdbl[39m [31m21[39m [33m21[39m [36m22.8[39m [32m21.4[39m [35m18.7[39m [34m18.1[39m
      cyl  [90mdbl[39m [31m6[39m [33m6[39m [36m4[39m [32m6[39m [35m8[39m [34m6[39m
      disp [90mdbl[39m [31m160[39m [33m160[39m [36m108[39m [32m258[39m [35m360[39m [34m225[39m
      hp   [90mdbl[39m [31m110[39m [33m110[39m [36m93[39m [32m110[39m [35m175[39m [34m105[39m
      drat [90mdbl[39m [31m3.9[39m [33m3.9[39m [36m3.85[39m [32m3.08[39m [35m3.15[39m [34m2.76[39m
      wt   [90mdbl[39m [31m2.62[39m [33m2.875[39m [36m2.32[39m [32m3.215[39m [35m3.44[39m [34m3.46[39m
      qsec [90mdbl[39m [31m16.46[39m [33m17.02[39m [36m18.61[39m [32m19.44[39m [35m17.02[39m [34m20.22[39m
      vs   [90mdbl[39m [31m0[39m [33m0[39m [36m1[39m [32m1[39m [35m0[39m [34m1[39m
      am   [90mdbl[39m [31m1[39m [33m1[39m [36m1[39m [32m0[39m [35m0[39m [34m0[39m
      gear [90mdbl[39m [31m4[39m [33m4[39m [36m4[39m [32m3[39m [35m3[39m [34m3[39m
      carb [90mdbl[39m [31m4[39m [33m4[39m [36m1[39m [32m1[39m [35m2[39m [34m1[39m

---

    Code
      palmerpenguins::penguins
    Output
      [90mtibble[39m [90m[344, 8][39m
      species           [90mfct[39m [31mAdelie[39m [33mAdelie[39m [36mAdelie[39m [32mAdelie[39m [35mAdelie[39m [34mAd[39m[1m~[22m
      island            [90mfct[39m [31mTorgersen[39m [33mTorgersen[39m [36mTorgersen[39m [32mTorgers[39m[35m[39m[34m[39m[1m~[22m
      bill_length_mm    [90mdbl[39m [31m39.1[39m [33m39.5[39m [36m40.3[39m [32m[7mNA[27m[39m [35m36.7[39m [34m39.3[39m
      bill_depth_mm     [90mdbl[39m [31m18.7[39m [33m17.4[39m [36m18[39m [32m[7mNA[27m[39m [35m19.3[39m [34m20.6[39m
      flipper_length_mm [90mint[39m [31m181[39m [33m186[39m [36m195[39m [32m[7mNA[27m[39m [35m193[39m [34m190[39m
      body_mass_g       [90mint[39m [31m3750[39m [33m3800[39m [36m3250[39m [32m[7mNA[27m[39m [35m3450[39m [34m3650[39m
      sex               [90mfct[39m [31mmale[39m [33mfemale[39m [36mfemale[39m [32m[7mNA[27m[39m [35mfemale[39m [34mmale[39m
      year              [90mint[39m [31m2007[39m [33m2007[39m [36m2007[39m [32m2007[39m [35m2007[39m [34m2007[39m

---

    Code
      spData::nz
    Output
      [90msf[39m [90m[16, 7][39m
      [90mactive geometry column: geom (MULTIPOLYGON)
      crs: 2193 (NZGD2000 / New Zealand Transverse Mercator 2000)
      crs unit: metre[39m
      Name          [90mchr[39m [31mNorthland[39m [33mAuckland[39m [36mWaikato[39m [32mBay of Plenty[39m [35m[39m[34m[39m[1m~[22m
      Island        [90mchr[39m [31mNorth[39m [33mNorth[39m [36mNorth[39m [32mNorth[39m [35mNorth[39m [34mNorth[39m
      Land_area     [90mdbl[39m [31m12500.561149[39m [33m4941.572557[39m [36m23900.036383[39m [32m120[39m[35m[39m[34m[39m[1m~[22m
      Population    [90mdbl[39m [31m175500[39m [33m1657200[39m [36m460100[39m [32m299900[39m [35m48500[39m [34m164000[39m
      Median_income [90mint[39m [31m23400[39m [33m29600[39m [36m27900[39m [32m26200[39m [35m24400[39m [34m26100[39m
      Sex_ratio     [90mdbl[39m [31m0.942453[39m [33m0.944286[39m [36m0.95205[39m [32m0.928039[39m [35m0.9349[39m[34m[39m[1m~[22m
      geom          [90msfc[39m [31mMPOLY 1.78kB[39m [33mMPOLY 2.29kB[39m [36mMPOLY 2.38kB[39m [32mMP[39m[35m[39m[34m[39m[1m~[22m

---

    Code
      data.table::as.data.table(palmerpenguins::penguins)
    Output
      [90mdata.table[39m [90m[344, 8][39m
      species           [90mfct[39m [31mAdelie[39m [33mAdelie[39m [36mAdelie[39m [32mAdelie[39m [35mAdelie[39m [34mAd[39m[1m~[22m
      island            [90mfct[39m [31mTorgersen[39m [33mTorgersen[39m [36mTorgersen[39m [32mTorgers[39m[35m[39m[34m[39m[1m~[22m
      bill_length_mm    [90mdbl[39m [31m39.1[39m [33m39.5[39m [36m40.3[39m [32m[7mNA[27m[39m [35m36.7[39m [34m39.3[39m
      bill_depth_mm     [90mdbl[39m [31m18.7[39m [33m17.4[39m [36m18[39m [32m[7mNA[27m[39m [35m19.3[39m [34m20.6[39m
      flipper_length_mm [90mint[39m [31m181[39m [33m186[39m [36m195[39m [32m[7mNA[27m[39m [35m193[39m [34m190[39m
      body_mass_g       [90mint[39m [31m3750[39m [33m3800[39m [36m3250[39m [32m[7mNA[27m[39m [35m3450[39m [34m3650[39m
      sex               [90mfct[39m [31mmale[39m [33mfemale[39m [36mfemale[39m [32m[7mNA[27m[39m [35mfemale[39m [34mmale[39m
      year              [90mint[39m [31m2007[39m [33m2007[39m [36m2007[39m [32m2007[39m [35m2007[39m [34m2007[39m

---

    Code
      mtcars
    Output
                           mpg cyl  disp  hp drat    wt  qsec vs am gear carb
      Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
      Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
      Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
      Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
      Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
      Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
      Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
      Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
      Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
      Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
      Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
      Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
      Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
      Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
      Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
      Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
      Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
      Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
      Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
      Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
      Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
      Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
      AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
      Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
      Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
      Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
      Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
      Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
      Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
      Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
      Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
      Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

---

    Code
      palmerpenguins::penguins
    Output
      [38;5;246m# A tibble: 344 x 8[39m
         species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
         [3m[38;5;246m<fct>[39m[23m   [3m[38;5;246m<fct>[39m[23m              [3m[38;5;246m<dbl>[39m[23m         [3m[38;5;246m<dbl>[39m[23m             [3m[38;5;246m<int>[39m[23m       [3m[38;5;246m<int>[39m[23m
      [38;5;250m 1[39m Adelie  Torgersen           39.1          18.7               181        [4m3[24m750
      [38;5;250m 2[39m Adelie  Torgersen           39.5          17.4               186        [4m3[24m800
      [38;5;250m 3[39m Adelie  Torgersen           40.3          18                 195        [4m3[24m250
      [38;5;250m 4[39m Adelie  Torgersen           [31mNA[39m            [31mNA[39m                  [31mNA[39m          [31mNA[39m
      [38;5;250m 5[39m Adelie  Torgersen           36.7          19.3               193        [4m3[24m450
      [38;5;250m 6[39m Adelie  Torgersen           39.3          20.6               190        [4m3[24m650
      [38;5;250m 7[39m Adelie  Torgersen           38.9          17.8               181        [4m3[24m625
      [38;5;250m 8[39m Adelie  Torgersen           39.2          19.6               195        [4m4[24m675
      [38;5;250m 9[39m Adelie  Torgersen           34.1          18.1               193        [4m3[24m475
      [38;5;250m10[39m Adelie  Torgersen           42            20.2               190        [4m4[24m250
      [38;5;246m# i 334 more rows[39m
      [38;5;246m# i 2 more variables: sex <fct>, year <int>[39m

---

    Code
      spData::nz
    Output
      Simple feature collection with 16 features and 6 fields
      Geometry type: MULTIPOLYGON
      Dimension:     XY
      Bounding box:  xmin: 1090144 ymin: 4748537 xmax: 2089533 ymax: 6191874
      Projected CRS: NZGD2000 / New Zealand Transverse Mercator 2000
      First 10 features:
                      Name Island Land_area Population Median_income Sex_ratio
      1          Northland  North 12500.561     175500         23400 0.9424532
      2           Auckland  North  4941.573    1657200         29600 0.9442858
      3            Waikato  North 23900.036     460100         27900 0.9520500
      4      Bay of Plenty  North 12071.145     299900         26200 0.9280391
      5           Gisborne  North  8385.827      48500         24400 0.9349734
      6        Hawke's Bay  North 14137.524     164000         26100 0.9238375
      7           Taranaki  North  7254.480     118000         29100 0.9569363
      8  Manawatu-Wanganui  North 22220.608     234500         25000 0.9387734
      9         Wellington  North  8048.553     513900         32700 0.9335524
      10        West Coast  South 23245.456      32400         26900 1.0139072
                                   geom
      1  MULTIPOLYGON (((1745493 600...
      2  MULTIPOLYGON (((1803822 590...
      3  MULTIPOLYGON (((1860345 585...
      4  MULTIPOLYGON (((2049387 583...
      5  MULTIPOLYGON (((2024489 567...
      6  MULTIPOLYGON (((2024489 567...
      7  MULTIPOLYGON (((1740438 571...
      8  MULTIPOLYGON (((1866732 566...
      9  MULTIPOLYGON (((1881590 548...
      10 MULTIPOLYGON (((1557042 531...

---

    Code
      data.table::as.data.table(palmerpenguins::penguins)
    Output
             species    island bill_length_mm bill_depth_mm flipper_length_mm
        1:    Adelie Torgersen           39.1          18.7               181
        2:    Adelie Torgersen           39.5          17.4               186
        3:    Adelie Torgersen           40.3          18.0               195
        4:    Adelie Torgersen             NA            NA                NA
        5:    Adelie Torgersen           36.7          19.3               193
       ---                                                                   
      340: Chinstrap     Dream           55.8          19.8               207
      341: Chinstrap     Dream           43.5          18.1               202
      342: Chinstrap     Dream           49.6          18.2               193
      343: Chinstrap     Dream           50.8          19.0               210
      344: Chinstrap     Dream           50.2          18.7               198
           body_mass_g    sex year
        1:        3750   male 2007
        2:        3800 female 2007
        3:        3250 female 2007
        4:          NA   <NA> 2007
        5:        3450 female 2007
       ---                        
      340:        4000   male 2009
      341:        3400 female 2009
      342:        3775   male 2009
      343:        4100   male 2009
      344:        3775 female 2009

