# 1. Loading packages & data:
library(psych)    
require(smacof)   
require(MASS) 
library(MASS) 

# 2. Checking the data for coding mistakes and other outliers/missing values that may be problematic.

summary(Nations)
describe(Nations)
str(Nations)

# 3. Converting similarities to dissimilarities

require(smacof)
nations.d <- sim2diss(Nations, method = 9, to.dist = TRUE)

nations.d


# 4. Non-metric multidimensional scaling


require(MASS)
nations_mds <- isoMDS(nations.d)
nations_mds

# Stress value - the lower the better. Below 5 is a good fit. Decent fit - below 15-10.


# 5. Plotting the coordinates for the two dimensional plot



x <- nations_mds$points[,1] # 1 refers to 1st coordinate
y <- nations_mds$points[,2] # 2 refers to 2nd coordinate
  
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2",
       main="Metric MDS", type="n")
text(x, y, labels = colnames(Nations), cex=.7)+
    
  

# putting in vertical and horizontal lines



plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2",
     xlim = range(nations_mds$points[,1])*1.2, type = "n")
text(x, y, labels = colnames(Nations), cex = 0.6)
abline(h=0, v=0, col = "gray60", lty = 2)




# 6. Shepard plot to visualise goodness of fit 

nations_shep <- Shepard(nations.d, nations_mds$points)

plot(nations_shep, pch = 20, xlab = "Dissimilarity",
     ylab = "Distance", col= "gray", main = "Shephard's Diagram")
lines(nations_shep$x, nations_shep$yf, type = "S")

