getwd()
movies <- read.csv("Movie_Rating.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMN", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

#Factor in R is basically a categorical variable

#Converting strings to factor
movies_fil <- movies
movies_fil <- as.data.frame(unclass(movies_fil, # Convert all columns to factor
                       stringsAsFactors = TRUE)
summary(movies_fil)                       
str(movies_fil)

#to convert the year column into factor, we use factor function
factor(movies_fil$Year)

movies_fil$Year <- factor(movies_fil$Year)
#movies_fil$Year is a actual column in dataset, we assign it the value of the same column by factorizing it


summary(movies_fil)
str(movies_fil)





#------------------------------------AESTHETICS-----------------------------------------
install.packages("ggplot2")
library(ggplot2)

#aes() is how your data maps to what you want to see.

ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating))


#add geometry
ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()


#add color
ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating, color=Genre)) +
  geom_point()


#add size
ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating, color=Genre, 
                            size=BudgetMN)) +
  geom_point()



#---------------------------------------Plotting with layers>>Geometry----------

p<-ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating, color=Genre, 
                               size=BudgetMN))

#point
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()


#-----------------------------------overriding aesthetics-----------------------

q <- ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating, color=Genre,
                                 size=BudgetMN))
#add geom layer
q + geom_point()

#overriding aesthetics
q + geom_point(aes(size=CriticRating))

#example 2
q + geom_point(aes(color=BudgetMN))

#q remains the same
q + geom_point()

#example 3
q + geom_point(aes(x=BudgetMN)) + xlab("Budget Millions $$")


#example 4
q + geom_line() + geom_point()

#reduce line size
q + geom_line(size=1) + geom_point()




#---------------------------------Mapping V/s Setting---------------------------

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

r + geom_point()

#ADD COLOR
#1. Mapping(what we've done so far)
r + geom_point(aes(color=Genre))     #here it is used to map a color to variable

#2. Settings
r + geom_point(color="DarkGreen")   #here we are setting a color 

#ERROR:
#r + geom_point(aes(color="DarkGreen))

#Mapping example
r + geom_point(aes(size=BudgetMN))

#Setting example
r + geom_point(size=5)

#ERROR:
#r + geom_point(aes(size=10))





#-----------------------------Histogram and Density Charts----------------------

s <- ggplot(data=movies, aes(x=BudgetMN))
s + geom_histogram(binwidth = 10)


#add color
s + geom_histogram(binwidth = 10, fill="Green") #setting the color

s + geom_histogram(binwidth = 10, aes(fill=Genre)) #map the color


#add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")


#Density charts

s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")







#-------------------------------Starting layer tips---------------------------

t <-ggplot(data=movies_fil, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="White", color="Blue")




#another way

t <- ggplot(data=movies_fil)
t + geom_histogram(binwidth = 10, aes(x=AudienceRating), 
                   fill="White", color="Blue")


#example
t + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating), 
                   fill="White", color="Blue")


#example: skeleton plot. We use it in the case when ypu want to create a plot
#but you wanna use different datasets on that plot

t <- ggplot()








#-------------------------Statistical Transformation----------------------------


?geom_smooth()

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                            color = Genre))

u + geom_point() + geom_smooth(fill=NA)




#boxplots
u <- ggplot(data=movies_fil, aes(x=Genre, y=AudienceRating, color=Genre))

u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
u + geom_boxplot(size=1.2) + geom_jitter() #helps to see the data better

#another way
u +geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)





#-----------------------Using Facets--------------------------------------------

v <- ggplot(data=movies_fil, aes(x=BudgetMN))
v + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")



#facets:
v + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") +
  facet_grid(Genre~., scales="free")


#scatter plot

w <-ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating, color=Genre))
w + geom_point(size=3)

#facets

w + geom_point(size=3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(size=3) + 
  geom_smooth() +
  facet_grid(Genre~Year)


w + geom_point(aes(size=BudgetMN)) + 
  geom_smooth() +
  facet_grid(Genre~Year)





#------------------------------Coordinates-------------------------------------

m <- ggplot(data=movies_fil, aes(x=CriticRating, y=AudienceRating, size=BudgetMN,
                                 color=Genre))

m + geom_point()

#limiting rows
m + geom_point() +
  xlim(50,100) +
  ylim(50, 100)

#won't work well always, why because

m <- ggplot(data=movies_fil, aes(x=BudgetMN))
m + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#now limiting
m + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") +
  ylim(0,50)

#instead-zoom
m + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") +
  coord_cartesian(ylim=c(0,50))


#improvement

w + geom_point(aes(size=BudgetMN)) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))



#-------------------------------THEMES----------------------------------------


o <- ggplot(data=movies_fil, aes(x=BudgetMN))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")

h

#axes labels

h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +

#label formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size= 30),
        axis.title.y = element_text(color="Red", size=30))

#tick mark formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size= 30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10))


#legend formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size= 30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))


#title to plot
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size= 30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color="DarkBlue",
                                  size=40,
                                  family="Courier"))




















