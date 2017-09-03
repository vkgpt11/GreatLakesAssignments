setwd("E:\\Git\\GreateLearningAssignments\\RProg")

#install.packages("MASS")
library(MASS)
input.data = Cars93

head(input.data)
head(input.data,10)

tail(input.data)
tail(input.data,10)


str(input.data)

summary(input.data)

## list names of columns
names(input.data)

## Setting variable
x = 3
x

x1 <- 7
x1

y = x+5
y

m = "Money"
m

players = c("Kohli", "Dhoni", "Ashwin","Md Shami")
players

typeof(players)
class(players)

# numeric vector 
v1 = c(1,2,3,4,5,6,7,8,9)
v1

class(v1)
str(v1)
summary(v1)

v2 = c(1*pi, 2*pi, 3*pi)
v2

v3 = c("Introduction", "To", "R")
v3
class(v3)


v4 = c(FALSE,T, TRUE,FALSE)
v4
class(v4)
str(v4)


v5 = c(1, pi)
v5
class(v5)

v6 = c("Introduction","To",pi)
v6
class(v6)

v7 = c("Introduction","To",1)
v7
class(v7)


# Creating a sequence 
s1 = 1:5
s1

s2 = seq(from=1, to=15,by=2)
s2

s3 = seq(from=1, to=15, length.out = 5)
s3

s3 = seq(from=0, to=16, length.out = 5)
s3


s4 = rep(7,times=5)
s4


## ******** 
# Comparing vectors
v.a = c(1,1,4,5,3,2)
v.b = c(4,1,5,5,1,2)
v.a == v.b

sum(v.a == v.b)

1 == "1" # Datatype preference
1 == 1.0 # Datatype preference


## Selecting Elements within a vector 
v.a[3]

v.a[1:3]

v.a[c(1,3,5)]

v.a[-3]


## Vector Arithmatics
v.a + v.b
v.a * v.b
mean(v.a)

## ***********************************
## List - Unlike Vectors, *****************

l1 = list(2,"m",players)
l1

class(l1)


l1[[2]]

l1[c(2,3)]

class(l1[[1]])

class(l1[[2]])

class(l1[[3]])

str(l1)

str(l1[[3]])

l1[[3]][3]




##================================================
## Getting help in R
##================================================

help("mean") #?mean

example(subset)

?subset

args(subset)

help(package='MASS')

data(package='MASS')

##================================================
## Dataframe
##================================================

dataframe.1 = data.frame(v.a,v.b,v3)
dataframe.1
## Note: Recycling rule applied for V3

## Adding row to dataframe
new.row = data.frame(v.a=9,v.b=12,v3="New")

dataframe.2 = rbind(dataframe.1,new.row)
dataframe.2

new.col = c("Time","To","Now","Add","A","New","Column")
dataframe.3 = cbind(dataframe.2,new.col)
dataframe.3

colnames(dataframe.3) = c("Session","Students","Topic","NewTopic")

nrow(dataframe.3)
ncol(dataframe.3)
dim(dataframe.3)

## Referencing Row and Columns in a Dataframe
dataframe.3[3,]

dataframe.3[,4]

dataframe.3[3,4]

dataframe.3$Session

dataframe.3$Session[3]

dataframe.3$Session[3]=66

dataframe.3$Session[3] 

## ********************************************
## Subsetting Dataframe
## ********************************************
dataframe.sub1=dataframe.3[,1:2]
dataframe.sub1
class(dataframe.sub1)

dataframe.sub2 = dataframe.3[,c("Session","Topic")]
dataframe.sub2

dataframe.sub3 = subset(dataframe.3,Students==5)
dataframe.sub3


dataframe.sub4 = subset(dataframe.3,Topic=="Introduction")
dataframe.sub4

## ********************************************
## Sorting Dataframe
## ********************************************

dataframe.3[order(dataframe.3$Students,dataframe.3$Session),]
dataframe.3[order(dataframe.3$Students, decreasing = TRUE),]

## ********************************************
## Apply function in R
## ********************************************



## ********************************************
## Factors in R
## ********************************************


factor.v.a = factor(v.a)
factor.v.a

wday =c("Mon","Fri","Mon","Wed","Wed","Sat")
factor.wday = factor(wday)
factor.wday

factor.order.wday = factor(wday, levels=c("Mon","Wed","Fri","Sat"), ordered =TRUE )
factor.order.wday


##============================================
## Understanding data visually
##============================================

head(input.data)

## Single Numeric Varriable 

hist(input.data$Horsepower)

##============================================
## Ggplot histogram -x is continous
##============================================

library(ggplot2)

ggplot(input.data,aes(x=Price)) 

ggplot(input.data,aes(x=Price)) + geom_histogram(binwidth = 2)

ggplot(input.data,aes(x=Price)) + geom_histogram(binwidth = 2, colour="white",fill="black")


##============================================
## Ggplot Barplot -x is Discrete
##============================================



ggplot(input.data,aes(x=Type,y=Price)) + geom_bar(stat = "identity")


ggplot(input.data,aes(x=Type,y=Price)) + geom_bar(stat = "identity",color="blue")+guides(fill=FALSE)


ggplot(input.data,aes(x=Type,y=Price)) + geom_bar(stat = "count",color="blue")+
guides(fill=FALSE)




