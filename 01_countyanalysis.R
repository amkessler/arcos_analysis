# https://cran.r-project.org/web/packages/arcos/readme/README.html

library(tidyverse)
library(lubridate)
library(janitor)
library(arcos)


#pull for test county totals in WV
wv <- summarized_county_annual(state="WV", key="WaPo")

#pull populations
population <- county_population(state="WV", key="WaPo") %>% 
  select(countyfips, year, population) # isolate the columns so it doesn't conflict in a join (there are doubles)
  

joined <- left_join(wv, population) 

