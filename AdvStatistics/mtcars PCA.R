#   Principal Component Analysis (PCA) is a popular 
#   method used in statistical learning approaches. 
#   PCA can be used to achieve dimensionality reduction 
#   in regression settings allowing us to explain a 
#   high-dimensional dataset with a smaller number of 
#   representative variables which, in combination, 
#   describe most of the variability found in 
#   the original high-dimensional data.


#   PCA can also be used in unsupervised learning 
#   problems to discover, visualise an explore patterns 
#   in high-dimensional datasets when there is not specific 
#   response variable. Additionally, PCA can aid in 
#   clustering exercises and segmentation models.


#   In this exercise, we???re going to look at PCA as a 
#   tool for unsupervised learning, data exploration 
#   and visualisation (remembering that visualisation 
#   is a key step in the exploratory data analysis process).


#   In high-dimensional datasets, the ability to visualise 
#   patterns among all variables is challenging. One way we 
#   can achieve this is by generating two-dimensional 
#   scatterplots containing all data points on two of all 
#   possible features. However, this technique does not help 
#   much when the number of features / variables is large. 
#   Consider, for example, the Motor Trend Car Road Test 
#   dataset from the 1974 Motor Trend US magazine (this dataset 
#   can be found in the library(datasets) package):


# Load necessary libraries


install.packages("datasets")
install.packages("ggplot2")
install.packages("FactoMineR")
install.packages("scales")
install.packages("rgl")
install.packages("knitr")
install.packages("scatterplot3d")
install.packages("factoextra")



library(datasets)
library(ggplot2)
library(FactoMineR)
library(scales)
library(rgl)
library(knitr)
library(scatterplot3d)
library(factoextra)

# only display the top 5 records of the mtcars dataset
dta <- mtcars
head(dta)

#   The mtcars dataset contains 32 observations each 
#   representing a specific car model and 11 variables 
#   each with a different measure derived from the road 
#   test or from the properties of the car.


#   Even in this basic example, visualising patterns 
#   among all variables in the data by running 
#   pairwise scatterplots is a challenging endeavour:


# Plot dataset
plot(dta, main="Pairwise Scatterplot of all variables in the mtcars dataset",
     col="blue", cex=0.3, pch=16)


#   By trying to visualise our dataset of cars (with 11 variables) 
#   through the pairwise scatterplot method, we end up having to 
#   look through more than 50 individual scatterplots! Now imagine 
#   having a dataset with a very large number of variables (hundreds) 
#   and trying to visualise and make sense of all of this!


#   That???s where PCA comes in quite handy.


#   PCA is a method that allows you to find low-dimensional 
#   representations of your data that can explain most of 
#   the variation and captures as much information about 
#   the dataset as possible. These low-dimensional 
#   representations are, essentially, called Principal 
#   Components and end up, simplistically speaking, taking 
#   the form of new variables. PCA can also be interpreted 
#   as low-dimensional linear surfaces that are as closest 
#   as possible to each individual observation in a dataset.


#   PCA computes the first principal component of a set of 
#   features / variables by a normalized (centered to mean zero) 
#   linear combination of the features that have the largest 
#   variance, which after a few mathematical computations, 
#   arrives on scores (Z1) for the first principal component. 
#   The second principal component (Z2), again, is the linear 
#   combination of all features / variables across all data 
#   points that have a maximum variance but that are not 
#   related with Z1. By making the second principal component 
#   uncorrelated to Z1, we are forcing it to be orthogonal 
#   (or perpendicular to the direction in which Z1 is projected). 
#   The idea here being that if we were to project the PCAs onto 
#   a two-dimensional plane, the second PCA would be perpendicular 
#   to the first PCA (hence, capturing the variance across both dimensions). 
#   Obviously, in a dataset with more than two variables, 
#   we can find multiple principal components.


#   Let???s get back to our example dataset of cars:


# Look at the differences in the mean for each variable
summary(dta)


#   Remember that one of the criteria for one to use PCA 
#   is to center variables to have mean zero. This is so 
#   Principal Components are not affected by the differences 
#   in scales found across all different variables in the data. 
#   For example, note how the mean for disp (displacement in 
#   cubic inches) is very different from the mean of say carb 
#   (number of carburettors) for example. If we do not scale 
#   our variables, the Principal Components in this case 
#   would be significantly influenced by the disp variable.



#   Let???s run a Principal Component Analysis on the cars dataset:


# Run Principal Component on the data
PC_res = PCA(dta, scale.unit=TRUE, ncp = dim(dta)[2], graph=FALSE)
summary(PC_res)


#   The summary output of PCA shows a bunch of results. 
#   It displays all 11 Principal Components created which 
#   contain the scores and their associated PVEs.


#   Notice that the first two Principal Components 
#   explain 84.17% of the variance in the data. 
#   Let???s plot the results:


# Plot the results of the two first Principal Components
biplot(PC_res$ind$coord, 
       PC_res$var$coord, 
       scale=0, 
       cex=0.7, 
       main="Biplot for the first two Principal Components", 
       xlab = "First Principal Component (explains ~60%)", 
       ylab="Second Principal Component (explains ~24%)")



#   The graph above displays the first two principal 
#   components which explain more than 84% of the 
#   variance in the cars dataset. The black car names 
#   represent the scores for the first two principal 
#   components. The red arrows represent the first two 
#   principal components loading vectors.


#   For example, we can see that the first PC 
#   (horizontal axis) places more positive weight on 
#   variables such as cyl (number of cylinders in a car), 
#   disp(displacement in cubic inches of a car) and places 
#   negative weights on variables such as mpg (miles per gallon). 
#   So we could say that the first PC places cars that are ???powerful 
#   and heavy??? on the right side and places cars that are ???economical??? 
#   and ???versatile??? on the left side.


#   The second PC (vertical axis) places positive weight on 
#   variables such as gear (number of forward gears a car has) 
#   and am (transmission type a=auto and m=manual) and negative 
#   weight on variables such as qsec (time in seconds it takes for 
#   a car to travel 1/4 mile). So we could argue that the second PC 
#   places cars that are ???manual with lots of gears??? on the top and 
#   cars that are ???more classic-looking and slower??? on the bottom.


#   Pick the Maseratti Bora which is located on the upper right 
#   hand corner of our biplot. According to our interpretation, 
#   cars placed on the top and to the left of the graph, should 
#   be ???powerful and heavy??? (right side) and ???manual with lots of 
#   gears??? (top side). As car lovers would know, a Maseratti is a 
#   sports car, and it???s a powerful car. Conversely, a Toyota 
#   Corona (positioned on the left lower corner of our biplot) 
#   is a more versatile and slower car.


#   We have identified that the first two PC explain more 
#   than 84% of the variance in the data.


#   However, how many Principal Components can be or are created? 
#   In general, the number of Principal Components created will 
#   be the minimum value found of either (n-1) where n is the 
#   number of data points in a dataset or (p) where p is the 
#   number of variables in your data. So for example, in our 
#   cars dataset, the minimum value between 31 
#   (number of observations - 1) and 11 (number of variables 
#   in the cars dataset) is the latter (11). So the 
#   expected number of Principal Components will be 11.


# Plot the rotation matrix with the coordinates
PC_res$var$coord


#   Above you can see that there are 11 distinct 
#   principal components as expected with their 
#   associated score vectors.


#   Also, from performing PCA, one may wonder 
#   how much information is lost by projecting a 
#   ???wide??? dataset onto a few principal components? 
#   The answer here is in the Proportion of Variance 
#   Explained (PVE) by each Principal Component, which 
#   is always a positive quantity that explains the 
#   variance of each Principal Component. The PVE is a 
#   positive quantity and the cumulative sum of PVEs will 
#   be 100%. So, once we plot the Principal Components, it???s 
#   always relevant to display the PVE of each Principal Component.


#   The next natural question is how many Principal Components 
#   should one consider? In general, the number of Principal 
#   Components in a dataset will be the minimum of either 
#   (n-1) where n is the number of data points or (p) where p 
#   is the number of variables in your data.


#   There is one technique to decide on the number of principal 
#   components one should use (for explaining most of the variance 
#   found in the data) and this is called the scree plot. 
#   In essence, a scree plot is a graph that displays the PVE on 
#   the vertical axis and the number of principal components found. 
#   And the way one chooses the number of principal components is 
#   by eyeballing the scree plot and identifying a point at which 
#   the proportion of variance explained by each subsequent principal 
#   component drops off (similar to the elbow method in K-means when 
#   you are trying to find the number of clusters to use).


#   Let???s plot the PVE explained by each component from our PCA:

fviz_eig(PC_res, addlabels = TRUE, ylim = c(0, 70))


#   We can see from the scree plot above that the 
#   point at which the proportion of variance explained 
#   by each subsequent principal component drops off is 
#   from the 3rd principal component.


#   Let???s now plot the first three principal components 
#   in an interactive 3D scatterplot (you can click on the 
#   graph and drag it around to observe each individual 
#   point in different angles. You can also zoom in and 
#   out using your mouse scroll wheel):


# Plot 3D PCA after defining the 3 dimensions from PCA

dims <- as.data.frame(PC_res$ind$coord)
dims_3 <- dims[,c(1:3)]
plot3d(dims_3$Dim.1, 
       dims_3$Dim.3, 
       dims_3$Dim.2, 
       type="s", 
       aspect=FALSE, 
       col="blue", 
       size=1, 
       main="3D plot of the first three Principal Components of the mtcars dataset", 
       sub="Click on and drag it around or zoom in or out to see it in different angles", 
       xlab="First PC (~60%)", 
       ylab="Third PC (~6%)", 
       zlab="Second PC (~24%)")
text3d(dims_3$Dim.1, 
       dims_3$Dim.3, 
       dims_3$Dim.2,
       row.names(dims_3), 
       cex=0.7, 
       adj=c(1,1))


#   Next, we could use the results of the PCA in a supervised 
#   learning work (in regression or classification). 
#   We could also continue and perform clustering analysis 
#   using the results of the PCA to create specific segments of 
#   cars that are similar in some ways.









