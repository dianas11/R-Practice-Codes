################################### -------EDA--------##########################
############-----1 Can explore the distribution of 1 variable
#####-----2 Can explorethe relationship between 2 variables.


data(iris)
names(iris)
summary(iris)

str(iris)


## examine the data distribution of a quantitative variable

hist(iris$Sepal.Length)   #distribution of a variable


boxplot(iris$Sepal.Length, main="Summary of iris", xlab="Sepal Length")




#explore relationship between two quantitative variables

plot(iris$Sepal.Length, iris$Sepal.Width)







#PLOTTING CATEGORICAL OR COUNT VARIABLES

data(mtcars)
names(mtcars)
summary(mtcars)
str(mtcars)
count <- table(mtcars$gear)
count
barplot(count, main="cars", xlab = "Number of Gears")
barplot(count, main="Cars", xlab = "Number of gears", horiz=TRUE)
barplot(count, main="Cars", xlab = "Number of gears", horiz=TRUE, col="blue")


#Improved data viz

library(ggplot2)

#relationship between sepal length and width of 3 different species
qplot(Sepal.Length, Petal.Length, data=iris, color=Species)

#we  see that IRIS setosa flowers have the narrowest petals
qplot(Sepal.Length, Petal.Length, data=iris, color=Species, size=Petal.Width)


## ADD labels to the plot

qplot(Sepal.Length, Petal.Length, data=iris, color=Species,
      xlab="Sepal Length", ylab="Petal Length",
      main="Sepal vs. Petal Length in Iris Data")

qplot(Sepal.Length, Petal.Length, data=iris, geom="line", color=Species)



## GGPLOT ###############

ggplot(data=iris, aes(Sepal.Length, Sepal.Width)) + geom_point()

#distinguish between species using color scheme
ggplot(data = iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = (Species)))

#alternative

ggplot(data = iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point()


ggplot(data = iris, aes(Sepal.Length, Sepal.Width, shape = Species)) + geom_point()


## 1. Whether it is qplot or ggplot, we can only specify color and shape on factor variables
## 2. Factors : Number representing categorical values.
## 3. function "factor" turns any number into  a qualitative representation.

str(mtcars)

# use mtcars as a factor in visualization

ggplot(mtcars, aes(x=mpg, y=wt, colour= factor(gear))) + geom_point()


#histogram
ggplot(iris, aes(x=Sepal.Length)) + geom_histogram()


ggplot(iris, aes(x=Sepal.Length, fill= Species)) + geom_histogram()

ggplot(iris, aes(x=Species, y=Sepal.Length)) + geom_boxplot()


#visualize relationship between the different variables for the 3 species.
ggplot(data=iris, aes(Sepal.Length, Sepal.Width)) + geom_point() + 
  facet_grid(. ~Species) + geom_smooth(method = "lm")











#################################################################################
#################################################################################

############------------ EDA USING XDA----------------------------##############

install.packages("devtools")
library(devtools)

install_github("ujjwalkarn/xda")
library(xda)

data(iris)
head(iris)


#summarize the quantitative data

numSummary(iris)

# n = total number of rows for that variable
# miss = number of rows with missing values
# miss% = percentage of total rows with missing values((miss/n)*100)
# 5% = 5th percentile value of that variable
# the percentile values are helpful in detecting outliers



### summarize the qualitative data

charSummary(iris)

# n = total number of rows for that variable
# miss = number of rows with missing values
# miss% = percentage of total rows with missing values((miss/n)*100)
## unique = number of unique levels of that variable.
#### NOTE: there is only one character column(Speices) in the iris dataset

bivariate(iris, 'Species', 'Sepal.Length')

##Bivariate analysis refers to the analysis of two 
###variables to determine relationships between them.

Plot(iris, 'Petal.Length') 
#plot petal.length with other numerical variables and variations in PL across 3 species.



###############################################################################

library(ggplot2)

head(iris)


## > qplot(x, y, data=data)

qplot(Sepal.Length, Sepal.Width, data=iris)

## default :: scatter plot

qplot(Sepal.Length, Sepal.Width, data=iris, colour=Species)


## > add a smoothing line

qplot(Sepal.Length, Sepal.Width, data=iris,
      geom=c("point", "smooth"))

qplot(Sepal.Length, Sepal.Width, data=iris, colour=Species,
      geom=c("point", "smooth"))


## > LINE
 qplot(Sepal.Length, Sepal.Width, data=iris, colour=Species, 
       geom=c("point", "line"))

 
 ## > BOXPLOT
 
 qplot(Species, Sepal.Length, data=iris, geom=c("boxplot"))
 # > order: factor, quant, data, geom

 
 ## >VIOLIN PLOT
 
 qplot(Species, Sepal.Length, data=iris,
       geom=c("violin"), trim=FALSE)

 #### Violin plots are similar to boxplots, except they also show the probability
 ##### density of the data at different values
 
 
 ## > Color the boxplot
 
 qplot(Species, Sepal.Length, data=iris,
       geom=c("boxplot"))
 
 qplot(Species, Sepal.Length, data=iris,
       geom=c("boxplot"), fill=Species)
 
 ## > display data points
 
 qplot(Species, Sepal.Length, data=iris,
       geom=c("boxplot", "jitter"), fill=Species)

 
 #### Histogram to examine the quantitative variable distribution
 
 qplot(Sepal.Width, data=iris, geom="histogram")
 
 qplot(Sepal.Width, data=iris, geom="histogram", fill=Species)

 
 ## DENSITY PLOT
 
 qplot(Sepal.Width, data=iris, geom="density")
 
 qplot(Sepal.Width, data=iris, geom="density", color=Species, 
       linetype = Species, xlab="Sepal Width",
       ylab="Species", main="Sepal Lenght of Species")

 
 
 
 ### GGPLOT2 ############
 
 ### > ggplot(data, aes(x=x, y=y)) + geom_how to render
 
 ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +geom_point()

 
 ## < HISTOGRAM
 
 ggplot(iris, aes(Sepal.Length)) + geom_histogram()
 
 ## > LINE PLOT FOR TIME SERIES
 
 ggplot(economics, aes(date, unemploy)) + geom_line()

 
 
 ##############################################################################
 
 #### >>>> SCATTER PLOTS: EXPLORE THE RELATIONSHIP BETWEEN 2 NUMERICAL VARIABLES

library(ggplot2)

 data(iris)
head(iris)
summary(iris)


#color by species

ggplot(data=iris) + 
  geom_point(mapping = aes(Sepal.Length, Sepal.Width, color=Species))

#size by species

ggplot(data=iris) +
  geom_point(mapping =aes(Sepal.Length, Sepal.Width, size=Species))

#shape by species

ggplot(data=iris) +
  geom_point(mapping =aes(Sepal.Length, Sepal.Width, shape=Species))

#transparency by species

ggplot(data=iris) +
  geom_point(mapping=aes(Sepal.Length, Sepal.Width, alpha=Species))




##############################################################################
####################### >>>>>> FACETING WITH GGPLOT2 <<<<<<<<#################


#### Faceting is the process that split the chart window in several small parts
### (a grid), and display a similar chart in each section. 
# Each section usually shows the same graph for a specific group of the dataset.



## Facets help split visualization into subplots based on the number of 
####  categories in the categorical variables.


library(ggplot2)
head(iris)

#facet: 1 row

ggplot(data=iris) + 
  geom_point(mapping= aes(Sepal.Length, Sepal.Width, color=Species))+
  facet_wrap(~ Species, nrow = 1)



##### mpg dataset

data("mpg")
head(mpg)
names(mpg)

unique(mpg$manufacturer)

ggplot(data=mpg) + 
  geom_point(mapping= aes(cty, hwy, color=manufacturer))+
  facet_wrap(~ manufacturer, nrow = 3)


### Facet grid
## Forms a matrix of panels defined by row and column faceting.
## It is most useful when you have two discrete variables.

head(mpg)
g <- ggplot(mpg, aes(hwy, cty)) +geom_point()
g

unique(mpg$fl)


## horizontal gridding

ggplot(data=mpg) + geom_point(mapping = aes(cty, hwy, color = manufacturer)) +
  facet_grid(rows = vars(fl)) ## fl - basis of subplotting


## alternative

ggplot(data=mpg) + 
  geom_point(mapping = aes(cty, hwy, color = manufacturer)) +
  facet_grid(fl ~.)



## vertical gridding

ggplot(data=mpg) + geom_point(mapping = aes(cty, hwy, color = manufacturer)) +
  facet_grid(cols = vars(fl))

## or

ggplot(data=mpg) + geom_point(mapping = aes(cty, hwy, color = manufacturer)) +
  facet_grid(.~fl)



###### facet on the basis of 2 categorical variables

## cyl : vertical(rows)
## fl  : columns
## row ~ col


ggplot(data=mpg) + 
  geom_point(mapping = aes(cty, hwy, color = manufacturer)) +
  facet_grid(cyl ~ fl)

### modify facet label

ggplot(data=mpg) +
  geom_point(mapping = aes(cty, hwy, color= manufacturer)) +
  facet_grid(cyl ~ fl) +
  theme(strip.text.x = element_text(size=8, angle=75),
        strip.text.y = element_text(size=12, face="bold"),
        strip.background = element_rect(colour = "red", fill = "green"))

## free scales
## choose whether the scales should be constant across all panels(the default),
## or whether we let them vary

data("mtcars")
names(mtcars)

g <-ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point()
g

g + facet_grid(. ~ cyl, scales = "free")




### ADD A SMOOTHING LINE

ggplot(data=iris) +
  geom_smooth(mapping = aes(x=Sepal.Length, y=Sepal.Width))

# or,

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_smooth()



#### smooth lines by species

ggplot(data=iris) + geom_smooth(mapping = aes(x=Sepal.Length,
                                              y=Sepal.Width, linetype=Species))


#### group by species

ggplot(data=iris) + 
  geom_smooth(mapping = aes(x=Sepal.Length,y=Sepal.Width, group = Species))


#### group by color 

ggplot(data=iris) +
  geom_smooth(mapping = aes(x=Sepal.Length,y=Sepal.Width, color=Species))


#### remove legend

ggplot(data=iris) +
  geom_smooth(mapping=aes(x=Sepal.Length,y=Sepal.Width, color=Species),
              show.legend = FALSE)


#### Combine geometries-display the point

ggplot(data=iris, mapping = aes(x=Sepal.Length,y=Sepal.Width)) +
  geom_point(mapping = aes(color=Species)) + geom_smooth()


ggplot(data=iris) +
  geom_point(mapping = aes(x=Sepal.Length,y=Sepal.Width, color=Species)) +
  geom_smooth(mapping = aes(x=Sepal.Length, y=Sepal.Width, color=Species))


# or,

ggplot(data=iris, mapping = aes(x=Sepal.Length,y=Sepal.Width, color=Species)) +
  geom_point() + geom_smooth()


###############################################################################
###############################################################################

######### >>>>>>>>>>>>>>>>>>> BOX PLOT <<<<<<<<<<<<<<<<<<<<<<< ################


ggplot(iris, aes(x=Species, y=Sepal.Width)) + geom_boxplot()


###### rotate the boxplot

g <- ggplot(iris, aes(x=Species, y=Sepal.Width)) + geom_boxplot()

g + coord_flip()


##### notched boxplot

ggplot(iris, aes(x=Species, y=Sepal.Width)) + geom_boxplot(notch = TRUE)


##### Change the color of boxplot

ggplot(iris, aes(x=Species, y=Sepal.Width)) + 
  geom_boxplot(outlier.colour = "red", outlier.size = 5)


##### add mean value too

g_mean <- ggplot(iris, aes(x=Species, y=Sepal.Width)) + geom_boxplot()
 g_mean + stat_summary(fun.y = mean, geom = "point")

 
 
##### change boxplot outline by color
 
 ggplot(iris, aes(x=Species, y=Sepal.Width, color=Species)) + geom_boxplot()

 
##### select own colors
 
 ggplot(iris, aes(x=Species, y=Sepal.Width, color=Species)) +
   geom_boxplot() + scale_color_manual(values = c("red", "purple", "green"))

 
##### select a palette
 
 ggplot(iris, aes(x=Species, y=Sepal.Width, color=Species)) +
   geom_boxplot() + scale_color_brewer(palette = "Set3")

 
##### fill by different colors(of species)
 
 
 ggplot(iris, aes(x=Species, y=Sepal.Width, fill=Species)) +
   geom_boxplot() 

 ggplot(iris, aes(x=Species, y=Sepal.Width, fill=Species)) +
   geom_boxplot() + scale_fill_brewer(palette = "Dark2") +
   theme(legend.position = "top")

 
##### MULTIPLE GROUPS(We need two qualitative variables)
 
 head(ToothGrowth)
 summary(ToothGrowth)

 ToothGrowth$dose <- as.factor(ToothGrowth$dose) 
 
 summary(ToothGrowth)

 str(ToothGrowth) 

 
 ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp)) +
   geom_boxplot()
 
 ggplot(ToothGrowth, aes(x=supp, y=len, fill=dose)) +
   geom_boxplot() + scale_fill_manual(values = c("red", "purple", "green"))
 
 
 
 
 ###############################################################################
 ###############################################################################
 
 ########## >>>>>>>>>>>>>>>>>>>HISTOGRAM<<<<<<<<<<<<<<<<<<<<<<< ################
 
 ## basic histogram
 
 ggplot(iris, aes(Sepal.Width)) + geom_histogram()

 
 ## adjust binwidth
 ## change the width of the histogram bins
 
 ggplot(iris, aes(Sepal.Width)) + geom_histogram(binwidth = 0.01)
 ggplot(iris, aes(Sepal.Width)) + geom_histogram(binwidth = 0.5)

 
 ## color by species
 
 ggplot(iris, aes(Sepal.Width,  fill= Species)) + 
   geom_histogram()
  
 ggplot(iris, aes(Sepal.Width,  color= Species)) + 
   geom_histogram()

 
 ggplot(iris, aes(Sepal.Width )) +
   geom_histogram(color="black", fill="red", linetype = "dashed")

 
 ## add a mean line
 
 library(plyr)
m <- ddply(iris, "Species", summarise, grp.mean = mean(Sepal.Width))
m


g <- ggplot(iris, aes(x=Sepal.Width, color=Species)) +
  geom_histogram(fill = "white", position = "dodge") +
  theme(legend.position = "top")
g

g + geom_vline(data = m, aes(xintercept=grp.mean, color=Species), 
               linetype="dashed") +
   theme(legend.position = "top")


## customize color

g + geom_vline(data = m, aes(xintercept=grp.mean, color=Species), 
               linetype="dashed") +
  theme(legend.position = "top") + 
  scale_color_manual(values=c("blue", "orange", "green"))


## frequency polygons

head(diamonds)
names(diamonds)

ggplot(diamonds, aes(price, stat(density), color= clarity)) +
         geom_freqpoly(binwidth = 400)



###############################################################################
###############################################################################

########## >>>>>>>>>>>>>>>>>>> BARPLOTS <<<<<<<<<<<<<<<<<<<<<< ################

#### Barplots are used to visualize discrete numerical variables.
## > like number of people in a group or the avg. of all the students in a class

## >> Barplots are single numerical entity as opposed to continuous distribution.

library(ggplot2)

head(iris)

head(diamonds)


### >>> How many items fall in a particular factor category?
### y-axis : count

ggplot(data=diamonds) + geom_bar(mapping = aes(x = color))

## or, 

ggplot(data=diamonds) + stat_count(mapping=aes(x=color))


## outline colors

ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=clarity, color=clarity))


## fill with colors

ggplot(data=diamonds) + geom_bar(mapping=aes(x=clarity, fill=clarity))


## color on the basis of two qualitative variables

ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=cut, fill=color)) #stacked bar



### >>> How many diamonds of a color have a certain cut

ggplot(data=diamonds, mapping = aes(x=cut, fill=color)) +
  geom_bar(alpha = 1/5, position = "identity")

## place each object where it occurs in the context of the graph

## compare individual values

ggplot(data=diamonds) + 
  geom_bar(mapping = aes(x=cut, fill=color), position = "dodge")

## the proportion of each category

ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=color, y=..prop.., group=1))



## bar plots of summaries from continuous numeric variables

library(plyr)
m=ddply(iris, "Species", summarise, grp.mean = mean(Sepal.Width))
m

g=ggplot(data=m, aes(x=Species, y=grp.mean)) +
  geom_bar(stat="identity")
g


## Horizontal bar plot

g + coord_flip()

## include mean, max, min

ggplot(data=iris) +
  stat_summary(mapping=aes(x=Species, y=Sepal.Width),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = mean)

## add error bars to the bar plot


## factor(x), quant variable(y), color=factor2

ggplot(diamonds, aes(clarity, price, fill=color)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")


# mean_se is gonna compute the mean +- the standard error

## use mean and se as the basis of error bar

# Alternative,

library(tidyverse)

mse = diamonds %>%
  group_by(cut, color) %>%
  summarise(new = list(mean_se(price)))  %>%#### compute mean and standard error of price which is the y variable
  unnest(new)

mse


mse %>%
  ggplot(aes(cut, y=y, fill = color)) +
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = ymin, ymax = ymax), position = "dodge")



###############################################################################
###############################################################################

########## >>>>>>>>>>>>>>>>>>> LINE CHARTS <<<<<<<<<<<<<<<<<<<< ################

## We make line charts when we have temporal or time series data

getwd()

setwd("E:\\R Programming")
getwd()


df = read_csv("NFA 2018.csv",
              col_types = cols(
                country = col_character(),
                `ISO alpha-3 code` = col_character(),
                UN_region = col_character(),
                UN_subregion = col_character(),
                year = col_integer(),
                record = col_character(),
                crop_land = col_double(),
                grazing_land = col_double(),
                forest_land = col_double(),
                fishing_ground = col_double(),
                built_up_land = col_double(),
                carbon = col_double(),
                total = col_double(),
                `Percapita GDP (2010 USD)` = col_double(),
                population = col_double()
              ))

head(df)

##summarize data
sea = df %>%
  filter(UN_subregion == "South-Eastern Asia") %>%
  group_by(country , year) %>%
  summarize(forest_avg = mean(forest_land , na.rm = TRUE)) 

head(sea)
tail(sea)

## how has the average forest cover changed from 1982-2013
## from different countries

ggplot(sea,aes(x = year , y = forest_avg , color = country)) +
  geom_line()+
  ggtitle("Forest Cover Area")



###########  >>>>>>>>>>>>>>>>>>>> using ggtheme package
install.packages("ggthemes")

library(ggthemes)


###### ordinary ggplot w/o theme

ggplot() + 
  geom_point(iris, mapping = aes(x=Petal.Width, y=Petal.Length, color=Species))


##### ggplot theme

ggplot() + 
  geom_point(iris, mapping = aes(x=Petal.Width, y=Petal.Length, 
                                 color=Species)) +
  theme_grey()


##### use ggthemes

ls("package:ggthemes")[grepl("theme_", ls("package:ggthemes"))]

## >> 1. calc theme

ggplot + 
  geom_point(iris, mapping = aes(x=Petal.Width, y=Petal.Length, 
                                 color=Species)) + theme_calc()

## >> 2. economist theme

ggplot + 
  geom_point(iris, mapping = aes(x=Petal.Width, y=Petal.Length, 
                                 color=Species)) + theme_economist()









