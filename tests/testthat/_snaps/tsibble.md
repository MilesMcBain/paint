# tsibble works

    Code
      paint(tsibble::pedestrian)
    Output
      [90mtsibble[39m [90m[66037, 5][39m
      [90mkey: Sensor
      index: Date_Time [1h][39m
      Sensor    [90mchr[39m  [31mBirrarung Marr[39m [33mBirrarung Marr[39m [36mBirrarung Marr[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date_Time [90mdttm[39m [31m2015-01-01[39m [33m2015-01-01 01:00:00[39m [36m2015-01-01 02[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date      [90mdate[39m [31m2015-01-01[39m [33m2015-01-01[39m [36m2015-01-01[39m [32m2015-01-01[39m [35m[39m[34m[39m[1m~[22m
      Time      [90mint[39m  [31m0[39m [33m1[39m [36m2[39m [32m3[39m [35m4[39m [34m5[39m
      Count     [90mint[39m  [31m1630[39m [33m826[39m [36m567[39m [32m264[39m [35m139[39m [34m77[39m

---

    Code
      paint(dplyr::group_by(tsibble::pedestrian, Sensor))
    Output
      [90mtsibble[39m [90m[66037, 5][39m
      [41mgrouped by:[49m [90mSensor[39m [90m[4][39m
      [90mkey: Sensor
      index: Date_Time [1h][39m
      Sensor    [90mchr[39m  [31mBirrarung Marr[39m [33mBirrarung Marr[39m [36mBirrarung Marr[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date_Time [90mdttm[39m [31m2015-01-01[39m [33m2015-01-01 01:00:00[39m [36m2015-01-01 02[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date      [90mdate[39m [31m2015-01-01[39m [33m2015-01-01[39m [36m2015-01-01[39m [32m2015-01-01[39m [35m[39m[34m[39m[1m~[22m
      Time      [90mint[39m  [31m0[39m [33m1[39m [36m2[39m [32m3[39m [35m4[39m [34m5[39m
      Count     [90mint[39m  [31m1630[39m [33m826[39m [36m567[39m [32m264[39m [35m139[39m [34m77[39m

---

    Code
      paint(tsibble::group_by_key(tsibble::pedestrian))
    Output
      [90mtsibble[39m [90m[66037, 5][39m
      [41mgrouped by:[49m [90mSensor[39m [90m[4][39m
      [90mkey: Sensor
      index: Date_Time [1h][39m
      Sensor    [90mchr[39m  [31mBirrarung Marr[39m [33mBirrarung Marr[39m [36mBirrarung Marr[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date_Time [90mdttm[39m [31m2015-01-01[39m [33m2015-01-01 01:00:00[39m [36m2015-01-01 02[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date      [90mdate[39m [31m2015-01-01[39m [33m2015-01-01[39m [36m2015-01-01[39m [32m2015-01-01[39m [35m[39m[34m[39m[1m~[22m
      Time      [90mint[39m  [31m0[39m [33m1[39m [36m2[39m [32m3[39m [35m4[39m [34m5[39m
      Count     [90mint[39m  [31m1630[39m [33m826[39m [36m567[39m [32m264[39m [35m139[39m [34m77[39m

---

    Code
      paint(tsibble::as_tsibble(tsibble::pedestrian, regular = FALSE))
    Output
      [90mtsibble[39m [90m[66037, 5][39m
      [90mkey: Sensor
      index: Date_Time [irregular][39m
      Sensor    [90mchr[39m  [31mBirrarung Marr[39m [33mBirrarung Marr[39m [36mBirrarung Marr[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date_Time [90mdttm[39m [31m2015-01-01[39m [33m2015-01-01 01:00:00[39m [36m2015-01-01 02[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      Date      [90mdate[39m [31m2015-01-01[39m [33m2015-01-01[39m [36m2015-01-01[39m [32m2015-01-01[39m [35m[39m[34m[39m[1m~[22m
      Time      [90mint[39m  [31m0[39m [33m1[39m [36m2[39m [32m3[39m [35m4[39m [34m5[39m
      Count     [90mint[39m  [31m1630[39m [33m826[39m [36m567[39m [32m264[39m [35m139[39m [34m77[39m

---

    Code
      paint(flights_tsbl)
    Output
      [90mtsibble[39m [90m[6, 20][39m
      [90mkey: carrier, flight
      index: sched_dep_datetime [irregular][39m
      year               [90mint[39m  [31m2013[39m [33m2013[39m [36m2013[39m [32m2013[39m [35m2013[39m [34m2013[39m
      month              [90mint[39m  [31m1[39m [33m1[39m [36m1[39m [32m1[39m [35m1[39m [34m1[39m
      day                [90mint[39m  [31m1[39m [33m1[39m [36m1[39m [32m1[39m [35m1[39m [34m1[39m
      dep_time           [90mint[39m  [31m542[39m [33m544[39m [36m554[39m [32m517[39m [35m554[39m [34m533[39m
      sched_dep_time     [90mint[39m  [31m540[39m [33m545[39m [36m600[39m [32m515[39m [35m558[39m [34m529[39m
      dep_delay          [90mdbl[39m  [31m2[39m [33m-1[39m [36m-6[39m [32m2[39m [35m-4[39m [34m4[39m
      arr_time           [90mint[39m  [31m923[39m [33m1004[39m [36m812[39m [32m830[39m [35m740[39m [34m850[39m
      sched_arr_time     [90mint[39m  [31m850[39m [33m1022[39m [36m837[39m [32m819[39m [35m728[39m [34m830[39m
      arr_delay          [90mdbl[39m  [31m33[39m [33m-18[39m [36m-25[39m [32m11[39m [35m12[39m [34m20[39m
      carrier            [90mchr[39m  [31mAA[39m [33mB6[39m [36mDL[39m [32mUA[39m [35mUA[39m [34mUA[39m
      flight             [90mint[39m  [31m1141[39m [33m725[39m [36m461[39m [32m1545[39m [35m1696[39m [34m1714[39m
      tailnum            [90mchr[39m  [31mN619AA[39m [33mN804JB[39m [36mN668DN[39m [32mN14228[39m [35mN39463[39m [34m[39m[1m~[22m
      origin             [90mchr[39m  [31mJFK[39m [33mJFK[39m [36mLGA[39m [32mEWR[39m [35mEWR[39m [34mLGA[39m
      dest               [90mchr[39m  [31mMIA[39m [33mBQN[39m [36mATL[39m [32mIAH[39m [35mORD[39m [34mIAH[39m
      air_time           [90mdbl[39m  [31m160[39m [33m183[39m [36m116[39m [32m227[39m [35m150[39m [34m227[39m
      distance           [90mdbl[39m  [31m1089[39m [33m1576[39m [36m762[39m [32m1400[39m [35m719[39m [34m1416[39m
      hour               [90mdbl[39m  [31m5[39m [33m5[39m [36m6[39m [32m5[39m [35m5[39m [34m5[39m
      minute             [90mdbl[39m  [31m40[39m [33m45[39m [36m0[39m [32m15[39m [35m58[39m [34m29[39m
      time_hour          [90mdttm[39m [31m2013-01-01 05:00:00[39m [33m2013-01-01 05:0[39m[36m[39m[32m[39m[35m[39m[34m[39m[1m~[22m
      sched_dep_datetime [90mdttm[39m [31m2013-01-01 05:40:00[39m [33m2013-01-01 05:4[39m[36m[39m[32m[39m[35m[39m[34m[39m[1m~[22m

