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

