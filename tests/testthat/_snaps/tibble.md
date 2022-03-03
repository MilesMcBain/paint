# tibble

    Code
      paint(tibble::tibble(foo = list(character(0))))
    Output
      [90mtibble[39m [90m[1, 1][39m
      foo [90mlst[39m [31mcharacter [0][39m

---

    Code
      paint(tst1)
    Output
      [90mtibble[39m [90m[3, 5][39m
      this     [90mdbl[39m [31m[7mNA[27m[39m [33m[7mNaN[27m[39m [36m3[39m
      that     [90mlst[39m [31mmatrix [2, 2][39m [33marray [3, 3, 3][39m [36m[7mNULL[27m[39m
      more     [90mlst[39m [31m[7mNA[27m[39m [33m[7mInf[27m[39m [36mcharacter [100][39m
      and_more [90mdbl[39m [31m1[39m [33m[7m-Inf[27m[39m [36m[7mInf[27m[39m
      tibbles  [90mlst[39m [31mtibble [1, 1][39m [33m[7mNULL[27m[39m [36mtibble [1, 1][39m

---

    Code
      paint(nested_penguins)
    Output
      [90mtibble[39m [90m[336, 7][39m
      species           [90mfct[39m [31mAdelie[39m [33mAdelie[39m [36mAdelie[39m [32mAdelie[39m [35mAdelie[39m [34mAd[39m[1m~[22m
      island            [90mfct[39m [31mTorgersen[39m [33mTorgersen[39m [36mTorgersen[39m [32mTorgers[39m[35m[39m[34m[39m[1m~[22m
      flipper_length_mm [90mint[39m [31m181[39m [33m186[39m [36m195[39m [32m[7mNA[27m[39m [35m193[39m [34m190[39m
      body_mass_g       [90mint[39m [31m3750[39m [33m3800[39m [36m3250[39m [32m[7mNA[27m[39m [35m3450[39m [34m3650[39m
      sex               [90mfct[39m [31mmale[39m [33mfemale[39m [36mfemale[39m [32m[7mNA[27m[39m [35mfemale[39m [34mmale[39m
      year              [90mint[39m [31m2007[39m [33m2007[39m [36m2007[39m [32m2007[39m [35m2007[39m [34m2007[39m
      cols              [90mlst[39m [31mtibble [1, 2][39m [33mtibble [1, 2][39m [36mtibble [1[39m[32m[39m[35m[39m[34m[39m[1m~[22m

---

    Code
      paint(nested_matrix)
    Output
      [90mtibble[39m [90m[32, 12][39m
      mpg        [90mdbl[39m [31m21[39m [33m21[39m [36m22.8[39m [32m21.4[39m [35m18.7[39m [34m18.1[39m
      cyl        [90mdbl[39m [31m6[39m [33m6[39m [36m4[39m [32m6[39m [35m8[39m [34m6[39m
      disp       [90mdbl[39m [31m160[39m [33m160[39m [36m108[39m [32m258[39m [35m360[39m [34m225[39m
      hp         [90mdbl[39m [31m110[39m [33m110[39m [36m93[39m [32m110[39m [35m175[39m [34m105[39m
      drat       [90mdbl[39m [31m3.9[39m [33m3.9[39m [36m3.85[39m [32m3.08[39m [35m3.15[39m [34m2.76[39m
      wt         [90mdbl[39m [31m2.62[39m [33m2.875[39m [36m2.32[39m [32m3.215[39m [35m3.44[39m [34m3.46[39m
      qsec       [90mdbl[39m [31m16.46[39m [33m17.02[39m [36m18.61[39m [32m19.44[39m [35m17.02[39m [34m20.22[39m
      vs         [90mdbl[39m [31m0[39m [33m0[39m [36m1[39m [32m1[39m [35m0[39m [34m1[39m
      am         [90mdbl[39m [31m1[39m [33m1[39m [36m1[39m [32m0[39m [35m0[39m [34m0[39m
      gear       [90mdbl[39m [31m4[39m [33m4[39m [36m4[39m [32m3[39m [35m3[39m [34m3[39m
      carb       [90mdbl[39m [31m4[39m [33m4[39m [36m1[39m [32m1[39m [35m2[39m [34m1[39m
      mtcars_mat [90marr[39m [90mdouble [32, 11][39m

---

    Code
      paint(nested_tibble)
    Output
      [90mtibble[39m [90m[32, 12][39m
      mpg        [90mdbl[39m [31m21[39m [33m21[39m [36m22.8[39m [32m21.4[39m [35m18.7[39m [34m18.1[39m
      cyl        [90mdbl[39m [31m6[39m [33m6[39m [36m4[39m [32m6[39m [35m8[39m [34m6[39m
      disp       [90mdbl[39m [31m160[39m [33m160[39m [36m108[39m [32m258[39m [35m360[39m [34m225[39m
      hp         [90mdbl[39m [31m110[39m [33m110[39m [36m93[39m [32m110[39m [35m175[39m [34m105[39m
      drat       [90mdbl[39m [31m3.9[39m [33m3.9[39m [36m3.85[39m [32m3.08[39m [35m3.15[39m [34m2.76[39m
      wt         [90mdbl[39m [31m2.62[39m [33m2.875[39m [36m2.32[39m [32m3.215[39m [35m3.44[39m [34m3.46[39m
      qsec       [90mdbl[39m [31m16.46[39m [33m17.02[39m [36m18.61[39m [32m19.44[39m [35m17.02[39m [34m20.22[39m
      vs         [90mdbl[39m [31m0[39m [33m0[39m [36m1[39m [32m1[39m [35m0[39m [34m1[39m
      am         [90mdbl[39m [31m1[39m [33m1[39m [36m1[39m [32m0[39m [35m0[39m [34m0[39m
      gear       [90mdbl[39m [31m4[39m [33m4[39m [36m4[39m [32m3[39m [35m3[39m [34m3[39m
      carb       [90mdbl[39m [31m4[39m [33m4[39m [36m1[39m [32m1[39m [35m2[39m [34m1[39m
      mtcars_mat [90mdf[39m  [90mtibble [32, 11][39m
      
      [1m[90mmtcars_mat[39m[22m [90mtibble[39m [90m[32, 11][39m
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
      paint(grouped_tibble)
    Output
      [90mtibble[39m [90m[344, 8][39m
      [41mgrouped by:[49m [90myear, sex, island, species[39m [90m[35][39m
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
      paint(dplyr::rowwise(grouped_tibble))
    Output
      [90mtibble[39m [90m[344, 8][39m
      [41mrowwise grouped by:[49m [90myear, sex, island, species[39m
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
      paint(dplyr::rowwise(palmerpenguins::penguins))
    Output
      [90mtibble[39m [90m[344, 8][39m
      [41mrowwise[49m [90m[39m
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
      paint(vec_tibble)
    Output
      [90mtibble[39m [90m[5, 2][39m
      vctr [90mpct%[39m [31m 0.0%[39m [33m 33.3%[39m [36m 66.7%[39m [32m100.0%[39m [35m NA%[39m
      nums [90mint[39m  [31m1[39m [33m2[39m [36m3[39m [32m4[39m [35m5[39m

---

    Code
      paint(tibble::tibble())
    Output
      [90mtibble[39m [90m[0, 0][39m

