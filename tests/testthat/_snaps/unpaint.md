# unpaint

    Code
      unpaint(sf::st_as_sf(tibble::as_tibble(spData::nz)))
    Output
      Simple feature collection with 16 features and 6 fields
      Geometry type: MULTIPOLYGON
      Dimension:     XY
      Bounding box:  xmin: 1090144 ymin: 4748537 xmax: 2089533 ymax: 6191874
      Projected CRS: NZGD2000 / New Zealand Transverse Mercator 2000
      [38;5;246m# A tibble: 16 x 7[39m
         Name         Island Land_~1 Popul~2 Media~3 Sex_r~4                      geom
         [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<chr>[39m[23m    [3m[38;5;246m<dbl>[39m[23m   [3m[38;5;246m<dbl>[39m[23m   [3m[38;5;246m<int>[39m[23m   [3m[38;5;246m<dbl>[39m[23m        [3m[38;5;246m<MULTIPOLYGON [m]>[39m[23m
      [38;5;250m 1[39m Northland    North   [4m1[24m[4m2[24m501.  [4m1[24m[4m7[24m[4m5[24m500   [4m2[24m[4m3[24m400   0.942 (((1745493 6001802, 1740~
      [38;5;250m 2[39m Auckland     North    [4m4[24m942. 1[4m6[24m[4m5[24m[4m7[24m200   [4m2[24m[4m9[24m600   0.944 (((1803822 5900006, 1791~
      [38;5;250m 3[39m Waikato      North   [4m2[24m[4m3[24m900.  [4m4[24m[4m6[24m[4m0[24m100   [4m2[24m[4m7[24m900   0.952 (((1860345 5859665, 1857~
      [38;5;250m 4[39m Bay of Plen~ North   [4m1[24m[4m2[24m071.  [4m2[24m[4m9[24m[4m9[24m900   [4m2[24m[4m6[24m200   0.928 (((2049387 5832785, 2051~
      [38;5;250m 5[39m Gisborne     North    [4m8[24m386.   [4m4[24m[4m8[24m500   [4m2[24m[4m4[24m400   0.935 (((2024489 5674920, 2019~
      [38;5;250m 6[39m Hawke's Bay  North   [4m1[24m[4m4[24m138.  [4m1[24m[4m6[24m[4m4[24m000   [4m2[24m[4m6[24m100   0.924 (((2024489 5674920, 2024~
      [38;5;250m 7[39m Taranaki     North    [4m7[24m254.  [4m1[24m[4m1[24m[4m8[24m000   [4m2[24m[4m9[24m100   0.957 (((1740438 5714538, 1743~
      [38;5;250m 8[39m Manawatu-Wa~ North   [4m2[24m[4m2[24m221.  [4m2[24m[4m3[24m[4m4[24m500   [4m2[24m[4m5[24m000   0.939 (((1866732 5664323, 1868~
      [38;5;250m 9[39m Wellington   North    [4m8[24m049.  [4m5[24m[4m1[24m[4m3[24m900   [4m3[24m[4m2[24m700   0.934 (((1881590 5489434, 1875~
      [38;5;250m10[39m West Coast   South   [4m2[24m[4m3[24m245.   [4m3[24m[4m2[24m400   [4m2[24m[4m6[24m900   1.01  (((1557042 5319333, 1554~
      [38;5;250m11[39m Canterbury   South   [4m4[24m[4m4[24m504.  [4m6[24m[4m1[24m[4m2[24m000   [4m3[24m[4m0[24m100   0.975 (((1686902 5353233, 1679~
      [38;5;250m12[39m Otago        South   [4m3[24m[4m1[24m186.  [4m2[24m[4m2[24m[4m4[24m200   [4m2[24m[4m6[24m300   0.951 (((1335205 5126878, 1336~
      [38;5;250m13[39m Southland    South   [4m3[24m[4m1[24m196.   [4m9[24m[4m8[24m300   [4m2[24m[4m9[24m500   0.979 (((1229078 5062352, 1221~
      [38;5;250m14[39m Tasman       South    [4m9[24m616.   [4m5[24m[4m1[24m100   [4m2[24m[4m5[24m700   0.972 (((1616643 5424521, 1624~
      [38;5;250m15[39m Nelson       South     422.   [4m5[24m[4m1[24m400   [4m2[24m[4m7[24m200   0.926 (((1624866 5417556, 1616~
      [38;5;250m16[39m Marlborough  South   [4m1[24m[4m0[24m458.   [4m4[24m[4m6[24m200   [4m2[24m[4m7[24m900   0.958 (((1686902 5353233, 1679~
      [38;5;246m# ... with abbreviated variable names 1: Land_area, 2: Population,[39m
      [38;5;246m#   3: Median_income, 4: Sex_ratio[39m

---

    Code
      unpaint(data.table::as.data.table(spData::nz))
    Output
                       Name Island  Land_area Population Median_income Sex_ratio
       1:         Northland  North 12500.5611     175500         23400 0.9424532
       2:          Auckland  North  4941.5726    1657200         29600 0.9442858
       3:           Waikato  North 23900.0364     460100         27900 0.9520500
       4:     Bay of Plenty  North 12071.1447     299900         26200 0.9280391
       5:          Gisborne  North  8385.8266      48500         24400 0.9349734
       6:       Hawke's Bay  North 14137.5244     164000         26100 0.9238375
       7:          Taranaki  North  7254.4804     118000         29100 0.9569363
       8: Manawatu-Wanganui  North 22220.6084     234500         25000 0.9387734
       9:        Wellington  North  8048.5528     513900         32700 0.9335524
      10:        West Coast  South 23245.4559      32400         26900 1.0139072
      11:        Canterbury  South 44504.4991     612000         30100 0.9753265
      12:             Otago  South 31186.3092     224200         26300 0.9511694
      13:         Southland  South 31196.0604      98300         29500 0.9785069
      14:            Tasman  South  9615.9760      51100         25700 0.9718981
      15:            Nelson  South   422.1952      51400         27200 0.9259674
      16:       Marlborough  South 10457.7455      46200         27900 0.9577922
             geom
       1: <XY[1]>
       2: <XY[3]>
       3: <XY[1]>
       4: <XY[1]>
       5: <XY[1]>
       6: <XY[1]>
       7: <XY[1]>
       8: <XY[1]>
       9: <XY[1]>
      10: <XY[1]>
      11: <XY[1]>
      12: <XY[1]>
      13: <XY[4]>
      14: <XY[1]>
      15: <XY[1]>
      16: <XY[2]>

