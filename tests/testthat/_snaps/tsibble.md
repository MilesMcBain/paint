# multiplication works

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
      tsibble [6, 20]
      key: carrier, flight
      index: sched_dep_datetime [irregular]
      year               int  2013 2013 2013 2013 2013 2013
      month              int  1 1 1 1 1 1
      day                int  1 1 1 1 1 1
      dep_time           int  542 544 554 517 554 533
      sched_dep_time     int  540 545 600 515 558 529
      dep_delay          dbl  2 -1 -6 2 -4 4
      arr_time           int  923 1004 812 830 740 850
      sched_arr_time     int  850 1022 837 819 728 830
      arr_delay          dbl  33 -18 -25 11 12 20
      carrier            chr  AA B6 DL UA UA UA
      flight             int  1141 725 461 1545 1696 1714
      tailnum            chr  N619AA N804JB N668DN N14228 N39463 N24211
      origin             chr  JFK JFK LGA EWR EWR LGA
      dest               chr  MIA BQN ATL IAH ORD IAH
      air_time           dbl  160 183 116 227 150 227
      distance           dbl  1089 1576 762 1400 719 1416
      hour               dbl  5 5 6 5 5 5
      minute             dbl  40 45 0 15 58 29
      time_hour          dttm 2013-01-01 05:00:00 2013-01-01 05:00:00 2013-01-01 06:0~
      sched_dep_datetime dttm 2013-01-01 05:40:00 2013-01-01 05:45:00 2013-01-01 06:0~

