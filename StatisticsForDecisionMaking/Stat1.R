getwd()
setwd("E:/Git/GreateLearningAssignments/StatisticsForDecisionMaking")

rm(list = ls())

library(psych)
library(car)
library(ggplot2)
library(IPSUR)


str(precip)
precip
class(precip)
summary(precip)
mean(precip)
sd(precip)
length(precip)

#### Histograms 

par(mfrow=c(1,2))
hist(precip,main="")
hist(precip,freq = FALSE, main="Histogram")


par(mfrow=c(1,2))
hist(precip, breaks = 10,main= "")
hist(precip, breaks = 30,main= "")


### Box plot

sort(precip)
mean(precip)
median(precip)
sd(precip)
quantile(precip,probs = c(0,0.25,0.50,0.75,1.00))

summary(precip)

boxplot(precip)

boxplot.stats(precip)$out
boxplot.stats(precip,coef=1.6)$out




