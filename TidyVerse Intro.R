library(tidyverse)


vignette("tibble")

class(iris)

#convert a data frame into tibble

i<- as_tibble(iris)

head(i)


install.packages("nycflights13")
library(nycflights13)


nycflights13::flights %>% View()


######-----------------------------COLUMN RENAMING------------------------------

r <- iris%>%rename(Petal.L = Petal.Length)
head(r)


##----filter and rename columns

sep <- iris %>%select(Sepal_L = Sepal.Length, Petal_L = Petal.Length, Sepal_W = Sepal.Width)
head(sep)


## to lower case

strl <- iris %>% select_all(str_to_lower)
head(strl)

strl2 <- iris %>% select_all(str_to_upper)
head(strl2)


## conditional selection

con1 <- iris %>% rename_if(is.numeric, str_to_upper)
head(con1)


con2 <- iris %>% rename_at(vars(starts_with("P")), str_to_lower)
head(con2)



####--------------------------TIDY DATA-LONG AND WIDE---------------------------

head(airquality) #wide format

##wide to long

names(airquality) <- tolower(names(airquality))

## wide --> long : gather
qty <- airquality %>% gather(attribute, value)
head(qty)
tail(qty)


## select columns to display

qty2 <- airquality %>% gather(attribute, value, ozone:wind)
head(qty2)
tail(qty2)


#or,

aqg <- airquality %>% gather(variable, value, -month, -day, na.rm = TRUE)
head(aqg)


## summarize

s = aqg %>% group_by(month, variable) %>%
  summarise(value=mean(value)) %>%
  spread(variable, value)              #converts long data format to wide

head(s)



####------------------------JOINING TABLES---------------------------------------

library(tidyverse)
library(nycflights13)

head(flights)

flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)
head(flights2)


##--------another data set

head(airlines)

##--------------------JOIN TWO TABLES-----------------------------------

x <- flights2 %>% left_join(airlines, by="carrier")
head(x)




## if we have more than one common column

head(weather)

y <- flights2 %>% left_join(weather)

## Joining, by = c("year", "month", "day", "hour", "origin")

head(y)

## semi join keep all the observations in x that match y


## create a top destination list
topd <- flights %>% count(dest, sort=TRUE) %>% head(10)
head(topd)

flights %>% semi_join(topd)


## anti join: drops all observations in x that matches y
### good for discovering mismatch
### identify flights that don't have a match in planes

flights %>% anti_join(planes, by="tailnum") %>%
  count(tailnum, sort=TRUE)




