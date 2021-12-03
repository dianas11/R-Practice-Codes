library(datasets)
data("iris")
View(iris)


#installed.packages("RCurl")

#library(RCurl)

#iril <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/iris.csv"))

head(iris, 5)
tail(iris, 5)


summary(iris)

sum(is.na(iris))

#skimr - expands on summary() by providing larger set of statistics

install.packages("skimr")
library(skimr)

install.packages("dplyr")



iris %>%
  dplyr::group_by(Species) %>%
  skim()


#panel plots

plot(iris)
plot(iris, col = "blue")


#scatter plot
plot(iris$Sepal.Width, iris$Sepal.Length, col = "red", xlab = "Sepal Width", ylab = "Sepal Length")


#histogram
hist(iris$Sepal.Width, col = "red", main = "Frequency distribution of Sepal Width")
hist(iris$Sepal.Length)


#feature plot
featurePlot(x = iris[, 1:4], #column slicing
            y = iris$Species,
            plot = "box",
            strip = strip.custom(par.strip.text = list(cex = .7) ),
            scales = list(x = list(relation = "free"),
                          y = list(relation = "free")))



#to achieve reproducible model: set the random seed number
set.seed(100)


#data splitting
TrainingIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
TrainingSet <- iris[TrainingIndex,]   #training set
TestingSet <- iris[-TrainingIndex,]   #Test Set

View(TrainingSet)
View(TestingSet)


#scatter plot
plot(TrainingSet$Sepal.Length, TrainingSet$Sepal.Width, col ="cyan", xlab = "Sepal Length", ylab = "Sepal Width")



library(caret) # Package for machine learning algorithms / CARET stands for Classification And REgression Training

#SVM model (polynomial kernel)

#Build training model

Model <- train(Species ~ ., data = TrainingSet,
               method = "svmPoly",
               na.action = na.omit,  #whenever there is a missing value it will delete it
               preProcess = c("scale", "center"),
               trControl = trainControl(method = "none"),
               tuneGrid = data.frame(degree = 1, scale=1, C=1))

#Build Cross Validation model

Model.cv <- train(Species ~ ., data = TrainingSet,
                  method = "svmPoly",
                  na.action = na.omit,
                  preProcess = c("scale", "center"),
                  trControl = trainControl(method = "cv", number = 10),
                  tuenGrid = data.frame(degree = 1, scale = 1, C=1))


#Apply model for prediction

Model.training <- predict(Model, TrainingSet)  #apply model to make prediction on the training set

Model.testing <- predict(Model, TestingSet)  #apply model to make prediction on testing set

Model.cv <- predict(Model.cv, TrainingSet)  #perform cross validation




#Model performance (Displays confusion matrix and statistics)

Model.training.conf <- confusionMatrix(Model.training, TrainingSet$Species)
Model.testing.conf <- confusionMatrix(Model.testing, TestingSet$Species)
Model.cv.conf <- confusionMatrix(Model.cv, TrainingSet$Species)


print(Model.training.conf)
print(Model.testing.conf)
print(Model.cv.conf)


#Feature Importance

Importance <- varImp(Model)
plot(Importance)
plot(Importance, col = "red")












