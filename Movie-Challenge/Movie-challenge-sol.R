#import data
getwd()
setwd("E:\\R Programming")
getwd()
movies <- read.csv("Section6-Homework-Data.csv")

#data exploration

head(movies)
str(movies)

#converting character strings to factor
movies[sapply(movies, is.character)] <- lapply(movies[sapply(movies, is.character)],
                                               as.factor)
str(movies)
summary(movies)


#activate ggplot
#install.packages("ggplot2")

library(ggplot2)

#insights:
ggplot(data=movies, aes(x=Day.of.Week)) + geom_bar()


#filter #1 for data frame

filt <- (movies$Genre == "action") | (movies$Genre == "animation") |
  (movies$Genre == "adventure") | (movies$Genre == "comedy") | 
  (movies$Genre == "drama")
mov <- movies[filt,]
mov


#filter #2 for data frame

filt2 <- movies$Studio %in% c("Fox", "Buena Vista Studios", "WB", 
                              "Universal", "Sony", "Paramount Pictures")

mov <- movies[filt & filt2,]
mov


#prepare the plot's data and aesthetics
colnames(mov)
rm(p)
plot_data <- ggplot(data=mov, aes(x=Genre, y = Gross...US))
plot_data

#add geometry
plot_data + 
  geom_jitter(aes(size = Budget...mill., color = Studio)) +
  geom_boxplot(alpha = 0.6) 

#to get rid of the outlier
q_geom_added <- plot_data + 
  geom_jitter(aes(size = Budget...mill., color = Studio)) +
  geom_boxplot(alpha = 0.6, outlier.color=NA) 

q_geom_added

#non data ink

q_geom_added <- q_geom_added +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

q_geom_added


#theme
q_geom_added <- q_geom_added +
  theme(axis.title.x = element_text(color="Blue", size=20),
        axis.title.y = element_text(color="Blue", size=20),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        plot.title = element_text(size=10, hjust=0.5),
        
        
        text = element_text(family="Comic Sans MS")
    )

q_geom_added


#legend topic edit

q_geom_added$labels$size <- "Budget $M"

q_geom_added



