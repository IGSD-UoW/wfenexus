library(tidyverse)

water_fp_crops <- ci_wf_prep_crops("Report47-Appendix-II.xlsx",
                              skip_rows = 3, country = "Poland")

write.csv(water_fp_crops, file = here::here("slupsk/data/wf_crops.csv"))


water_fp_animals <- ci_wf_prep_animals("Report48-Appendix-V.xlsx",
                                       country = "Poland")

write.csv(water_fp_animals, file = here::here("slupsk/data/wf_animals.csv"))



