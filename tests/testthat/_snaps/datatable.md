# data.table

    Code
      paint(pp_dt)
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
      paint(pp_dt_keyed)
    Output
      [90mdata.table[39m [90m[344, 8][39m 
      [90mkeys: body_mass_g, flipper_length_mm[39m 
      species           [90mfct[39m [31mAdelie[39m [33mGentoo[39m [36mChinstrap[39m [32mAdelie[39m [35mAdelie[39m[34m[39m[1m~[22m
      island            [90mfct[39m [31mTorgersen[39m [33mBiscoe[39m [36mDream[39m [32mBiscoe[39m [35mBiscoe[39m [34m[39m[1m~[22m
      bill_length_mm    [90mdbl[39m [31m[7mNA[27m[39m [33m[7mNA[27m[39m [36m46.9[39m [32m36.5[39m [35m36.4[39m [34m33.1[39m
      bill_depth_mm     [90mdbl[39m [31m[7mNA[27m[39m [33m[7mNA[27m[39m [36m16.6[39m [32m16.6[39m [35m17.1[39m [34m16.1[39m
      flipper_length_mm [90mint[39m [31m[7mNA[27m[39m [33m[7mNA[27m[39m [36m192[39m [32m181[39m [35m184[39m [34m178[39m
      body_mass_g       [90mint[39m [31m[7mNA[27m[39m [33m[7mNA[27m[39m [36m2700[39m [32m2850[39m [35m2850[39m [34m2900[39m
      sex               [90mfct[39m [31m[7mNA[27m[39m [33m[7mNA[27m[39m [36mfemale[39m [32mfemale[39m [35mfemale[39m [34mfemale[39m
      year              [90mint[39m [31m2007[39m [33m2009[39m [36m2008[39m [32m2008[39m [35m2008[39m [34m2008[39m 

---

    Code
      paint(data.table::data.table())
    Output
      [90mdata.table[39m [90m[0, 0][39m

