#import library
library(caTools)
library(randomForest)
library(ggplot2)
#import data
data=read.csv('DecisonTree/Position_Salaries.csv')
data <- data[2:3]
rdForest <- randomForest(x=data[1],y=data$Salary,ntree =100)
#info about randomForest result
summary(rdForest)
#predicting a new result 
y_pred=predict(rdForest,newdata = data.frame(Level=6.5))
#Visualising result 
x_grid=seq(min(data$Level),max(data$Level),0.01)
ggplot()+geom_point(aes(x =data$Level,y=data$Salary),colour='red')+
  geom_line(aes(x =x_grid,y=predict(rdForest,newdata = data.frame(Level=x_grid))),colour='Blue')+
  ggtitle('Decison Tree')+
  xlab('Level')+
  ylab('salary')  
#Visualising Prediction 
ggplot()+geom_point(aes(x =6.5,predict(rdForest,newdata = data.frame(Level=6.5))),colour='red')+
  geom_line(aes(x =x_grid,y=predict(rdForest,newdata = data.frame(Level=x_grid))),colour='Blue')+
  ggtitle('Decison Tree')+
  xlab('Level')+
  ylab('salary')  