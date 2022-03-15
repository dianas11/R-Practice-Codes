head(airquality)

library(datasets)
library(dplyr)


# data selection
####### select a few columns by name


select_n =select(airquality, Ozone, Month)
head(select_n)


# drop a column

drop_day = select(airquality, -Day)
head(drop_day)


# data filter

filter(airquality, Ozone > 25 & Temp > 75)
f <-filter(airquality, Ozone > 25 & Temp > 75)
head(f)


# add a column

dm <- mutate(airquality, TempInC = (Temp - 32)*5/9)
head(dm)


# summarize and group data

summarise(airquality, mean(Ozone, na.rm=TRUE))

### group by: average wind value per month
### month is the basis of group

summarise(group_by(airquality, Month), mean(Wind, na.rm=TRUE))


#_________________________________Summarize using pipe operatorr-------------------------------------


airquality %>% select(Ozone, Temp) %>% head()


#data summary

airquality %>% 
  summarise(avg = mean(Ozone, na.rm=TRUE),
                         min = min(Ozone, na.rm=TRUE),
                         max = max(Ozone, na.rm=TRUE),
                         total = n())

#summarize by month

airquality %>%
  group_by(Month) %>%
  summarise(mean(Temp, na.rm=TRUE))


#remove 5th month and group by

airquality %>%
  filter(Month != 5) %>%
  group_by(Month) %>%
  summarise(mean(Temp, na.rm = TRUE))


airquality %>%
  select(Month, Ozone, Wind) %>%
  filter(Wind > 12)







