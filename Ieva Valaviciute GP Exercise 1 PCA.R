# 1. Loading the data and the packages


library(tidyverse)
library(tidyr)
library(ggplot2)
library(gridExtra)

View(PAQ_Ieva) # Checking the dataset for irregularities



# 2. Transforming the data from long to wide format

require(reshape2) 
PAQ_Ieva_wide <- dcast(PAQ_Ieva, id ~ var, value.var="value")

summary(PAQ_Ieva_wide) # Checking the wide dataset for irregularities
str(PAQ_Ieva_wide)
describe(PAQ_Ieva_wide)

# 3. Since there are only 3 individuals with missing values (which is a small proportion of individuals: 3/300) it has been decided to drop the cases with missing values. Since it is such a small proportion, it should not lead to serious biases in the following analysis. 

 <- PAQ_Ieva_wide %>%
  drop_na()

summary(PAQ_Ieva_wide1)
head(PAQ_Ieva_wide1)

# 4. Calculation of correlation matrix, excluding the variables of gender, age and ID, data collected for descriptive purposes only.

PAQ_Ieva_wide1 <- PAQ_Ieva_wide1[ , c("Q1_cry", "Q2_help", "Q3_breathe", "Q4_freeze", "Q5_alien", "Q6_inferior", "Q7_weep", "Q8_Support", "Q9_Nerd")] 

cor(PAQ_Ieva_wide1) 

# 5. Constructing a Principal Components Analysis

results <- prcomp(PAQ_Ieva_wide1, scale = TRUE)
results$rotation <- -1*results$rotation
results$rotation
results


pca <- princomp(PAQ_Ieva_wide1, cor=T)
summary(pca, loadings = T) # checking a percentage of the total variation in the dataset that each component explains


# 6. Deciding on the number of components

## Scree diagram: plots the number of components against the explained variance

var_explained = pca$sdev^2 / sum(pca$sdev^2)
var_explained

qplot(c(1:9), var_explained) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot") +
  ylim(0, 1) # the "elbow" joint is apparent right at about 2nd component, which means anything that comes after it is not worthwile.


# Log eigenvalue diagram

plot(log(pca$sdev^2),     
     xlab= "Component number", 
     ylab="Component variance",
     type = "l", 
     main="Log(Eigenvector) diagram",     
     xaxt = 'n')
axis(side=1,at=c(1,2,3,4,5,6,7,8,9),labels=c("1","2","3","4","5","6","7","8","9"))

# Plot representing how much variance is explained by each of the components

plot(pca, col="lightblue")

# From the results we can observe the following:
##The first principal component explains 57.62% of the total variance in the dataset.
###The second principal component explains 11.88% of the total variance in the dataset.
####The third principal component explains 9.79% of the total variance in the dataset.
#####Therefore, the first two components explain the majority of the total variance in the data.


# 7.Linear combination of components & interpretation of components

# Scatterplot participants values according to component 1

plot1 <- plot(pca$scores[,1], 
     xlab="Participant",  
     ylab="Component.1",
     xaxt = 'n')
axis(side=1,at=c(1,50,100,150,200,250,300),labels=c(1,50,100,150,200,250,300))

# Scatterplot participants values according to component 2

plot2 <- plot(pca$scores[,2], 
     xlab="Participant",  
     ylab="Component.2",
     xaxt = 'n')
axis(side=1,at=c(1,50,100,150,200,250,300),labels=c(1,50,100,150,200,250,300))

# Barplots for each component where every bar represents one participant

barplot(pca$scores[,1], 
        xlab="Participant",  
        ylab="Component.1",
        xaxt = 'n')
axis(side=1,at=c(1,50,100,150,200,250,300),labels=c(1,50,100,150,200,250,300))


barplot(pca$scores[,2], 
        xlab="Participant",  
        ylab="Component.2",
        xaxt = 'n')
axis(side=1,at=c(1,50,100,150,200,250,300),labels=c(1,50,100,150,200,250,300))

# 8. Biplot of the first two principal components  

biplot(pca,col=c("black","red"),
       xlab="Comp 1 (55.56 % variance explained)", ylab="Comp 2 (11.68 % variance explained)")


