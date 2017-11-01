#------And then load these packages, along with the boot package.-----
rm(list=ls())
library(corpcor)
library(GPArotation)
library(psych)
library(ggplot2)
library(ggfortify)
library(nFactors)
library(plyr)
library(reshape)
library(robustHD)
library(dplyr)
library(expm)
library(Hmisc)

#********************* RAQ Example ********************

#load data places.csv

places1<-read.csv(file.choose())

str(places1)

install.packages("corrplot")
library(corrplot)
# Perform a logarithmic transformation to make the data homogenous

places1$clmterrain<-log10(places1$clmterrain)
places1$housing<-log10(places1$housing)
places1$healthcare<-log10(places1$healthcare)
places1$crime<-log10(places1$crime)
places1$transportation<-log10(places1$transportation)
places1$education<-log10(places1$education)
places1$arts<-log10(places1$arts)
places1$recreation<-log10(places1$recreation)
places1$economics<-log10(places1$economics)

places
places<-places1[1:9]
  #create a correlation matrix


corrmatrix<-cor(places)
corrmatrix
corPlot(corrmatrixo)
corrplot(corrmatrixo)


#Bartlett's test
###Calculating Bartlett test
### Bartlett's test - null hypothesis H0 - Dimension reduction is not possible
### Alternate Hypothesis - Dimension reduction is possible
install.packages("psych")
library(psych)
#calculating the Batlett's sphericity test with the cortest.bartlett function ("psych" package)

print(cortest.bartlett(corrmatrix, nrow(places)))

# p value is lesser than 0.05 , Hence reject null hypothesis. 
# Hence Dimension Reduction is a possibility

KMO(corrmatrix)


#### principal component using prcomp and biplot
places.pca <- prcomp(places,center=TRUE, scale.=TRUE)


places.pca$rotation #### same as loadings
summary(places.pca) #### View Summary for Variance and Cumulative Variance


# Sum of squares of the Sdev gives the total count of Independent Variables in the dataset
sum((places.pca$sdev)^2)


### screeplot
screeplot(type="line",places.pca)
prop_var <- summary(places.pca)$importance[2,]
plot(prop_var, main = "Scree plot", xlab = "Principal Component", ylab =  "Proportion of Variance Explained", type = "b")

######### biplot

biplot(places.pca, choices=c(1,2))


