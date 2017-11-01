rm(list=ls())

setwd("F:/Sridhar/PGPBA/Courses/SMDM/SMDM Mumbai")
stockret<-read.csv('hyptest.csv', header=TRUE)


#### One-Sample (Large) two-tail Test
t.test(stockret$rtwipro,mu=0.0075) # Ho: mu=0.0075

#### One-Sample (Large) one-tail Test
t.test(stockret$rtwipro, mu=0.0075, alternative="greater")

t.test(stockret$rtwipro, mu=0.0075, alternative="less")

####One sample test at a different confidence level
t.test(stockret$rtwipro, mu=0.0075, conf.level=0.99)



### Two-sample t-test with equal variances
t.test(stockret$rttata,stockret$rtwipro, var.equal=TRUE, paired=FALSE)


#### Variance test of two samples
###Do two samples come from populations with equal variancess?

var.test(stockret$rttata,stockret$rtwipro)


#### Two-sample t-test with unequal varainces
t.test(stockret$rttata,stockret$rtwipro)

t.test(stockret$rttata,stockret$rtwipro,mu=0.0075, alternative="greater")


#### Proportion test
heads <- rbinom(1, size = 100, prob = .5)
prop.test(heads, 100) 

prop.test(heads, 100, correct = FALSE)

survivors <- matrix(c(1781,1443,135,47), ncol=2)
colnames(survivors) <- c('survived','died')
rownames(survivors) <- c('no seat belt','seat belt')
survivors

result.prop <- prop.test(survivors)
result.prop 



library(MASS)         # load the MASS package 
head(quine) 
table(quine$Eth, quine$Sex)

####Problem: Assuming that the data in quine follows the normal distribution, 
####find the 95% confidence interval estimate of the difference between the 
####female proportion of Aboriginal students and the female proportion of Non-Aboriginal 
#####students, each within their own ethnic group.

prop.test(table(quine$Eth, quine$Sex), correct=FALSE) 

smokers  <- c( 83, 90, 129, 70 )
patients <- c( 86, 93, 136, 82 )
prop.test(smokers, patients)

