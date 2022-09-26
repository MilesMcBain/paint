# sf

    Code
      paint(spData::nz)
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
      paint(sf::st_as_sf(tibble::as_tibble(spData::nz)))
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
      paint(spData::seine)
    Output
      [90msf[39m [90m[3, 2][39m
      [90mactive geometry column: geometry (MULTILINESTRING)
      crs: 2154 (RGF93 / Lambert-93)
      crs unit: metre[39m
      name     [90mchr[39m [31mMarne[39m [33mSeine[39m [36mYonne[39m
      geometry [90msfc[39m [31mMLINES 3.44kB[39m [33mMLINES 6.29kB[39m [36mMLINES 2.72kB[39m

---

    Code
      paint(tnz)
    Output
      [90msf[39m [90m[16, 7][39m
      [90mactive geometry column: geom (MULTIPOLYGON)
      crs: [31m[7mNA[27m[90m
      crs unit: [31m[7mNA[27m[90m[39m
      Name          [90mchr[39m [31mNorthland[39m [33mAuckland[39m [36mWaikato[39m [32mBay of Plenty[39m [35m[39m[34m[39m[1m~[22m
      Island        [90mchr[39m [31mNorth[39m [33mNorth[39m [36mNorth[39m [32mNorth[39m [35mNorth[39m [34mNorth[39m
      Land_area     [90mdbl[39m [31m12500.561149[39m [33m4941.572557[39m [36m23900.036383[39m [32m120[39m[35m[39m[34m[39m[1m~[22m
      Population    [90mdbl[39m [31m175500[39m [33m1657200[39m [36m460100[39m [32m299900[39m [35m48500[39m [34m164000[39m
      Median_income [90mint[39m [31m23400[39m [33m29600[39m [36m27900[39m [32m26200[39m [35m24400[39m [34m26100[39m
      Sex_ratio     [90mdbl[39m [31m0.942453[39m [33m0.944286[39m [36m0.95205[39m [32m0.928039[39m [35m0.9349[39m[34m[39m[1m~[22m
      geom          [90msfc[39m [31mMPOLY 1.78kB[39m [33mMPOLY 2.29kB[39m [36mMPOLY 2.38kB[39m [32mMP[39m[35m[39m[34m[39m[1m~[22m

---

    Code
      paint(sf::st_as_sf(tst_sf))
    Output
      [90msf[39m [90m[3, 2][39m
      [90mactive geometry column: geom (POINT, LINESTRING, MULTIPOLYGON)
      crs: [31m[7mNA[27m[90m
      crs unit: [31m[7mNA[27m[90m[39m
      num  [90mdbl[39m [31m1[39m [33m2[39m [36m3[39m
      geom [90msfc[39m [31mPOINT 424B[39m [33mLINES 600B[39m [36mMPOLY 1.78kB[39m

---

    Code
      paint(grouped_nz)
    Output
      [90msf[39m [90m[16, 7][39m
      [90mactive geometry column: geom (MULTIPOLYGON)
      crs: 2193 (NZGD2000 / New Zealand Transverse Mercator 2000)
      crs unit: metre[39m
      [41mgrouped by:[49m [90mIsland[39m [90m[2][39m
      Name          [90mchr[39m [31mNorthland[39m [33mAuckland[39m [36mWaikato[39m [32mBay of Plenty[39m [35m[39m[34m[39m[1m~[22m
      Island        [90mchr[39m [31mNorth[39m [33mNorth[39m [36mNorth[39m [32mNorth[39m [35mNorth[39m [34mNorth[39m
      Land_area     [90mdbl[39m [31m12500.561149[39m [33m4941.572557[39m [36m23900.036383[39m [32m120[39m[35m[39m[34m[39m[1m~[22m
      Population    [90mdbl[39m [31m175500[39m [33m1657200[39m [36m460100[39m [32m299900[39m [35m48500[39m [34m164000[39m
      Median_income [90mint[39m [31m23400[39m [33m29600[39m [36m27900[39m [32m26200[39m [35m24400[39m [34m26100[39m
      Sex_ratio     [90mdbl[39m [31m0.942453[39m [33m0.944286[39m [36m0.95205[39m [32m0.928039[39m [35m0.9349[39m[34m[39m[1m~[22m
      geom          [90msfc[39m [31mMPOLY 1.78kB[39m [33mMPOLY 2.29kB[39m [36mMPOLY 2.38kB[39m [32mMP[39m[35m[39m[34m[39m[1m~[22m

