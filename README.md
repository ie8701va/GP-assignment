`# Non-Metric Multidimensional Scaling (MDS) Analysis

This repository contains an R script that performs Non-Metric Multidimensional Scaling (MDS) analysis on a dataset of country similarities. The analysis involves converting similarity data into dissimilarities, performing MDS, and visualizing the results with various plots.

## Table of Contents

- [Introduction](#introduction)
- [Script Overview](#script-overview)
 - [1\. Loading Packages and Data](#1-loading-packages-and-data)
 - [2\. Data Inspection](#2-data-inspection)
 - [3\. Converting Similarities to Dissimilarities](#3-converting-similarities-to-dissimilarities)
 - [4\. Non-Metric Multidimensional Scaling](#4-non-metric-multidimensional-scaling)
 - [5\. Plotting MDS Coordinates](#5-plotting-mds-coordinates)
 - [6\. Shepard Plot for Goodness of Fit](#6-shepard-plot-for-goodness-of-fit)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Notes](#notes)

---

## Introduction

Multidimensional Scaling (MDS) is a technique used to visualize the level of similarity or dissimilarity of data points. In this script, we conduct a Non-Metric MDS analysis on a dataset representing country similarities. The goal is to represent these countries in a lower-dimensional space, while preserving the relative distances between them.

## Script Overview

### 1. Loading Packages and Data

The script starts by loading the necessary R packages:
- `psych`
- `smacof`
- `MASS`

These packages provide the tools required for data inspection, dissimilarity conversion, and MDS analysis.

### 2. Data Inspection

Before proceeding with the analysis, the script inspects the dataset to identify any coding mistakes, outliers, or missing values. The following functions are used:
- `summary(Nations)`: Provides a summary of the dataset.
- `describe(Nations)`: Offers descriptive statistics.
- `str(Nations)`: Displays the structure of the dataset.

### 3. Converting Similarities to Dissimilarities

The script converts the similarity data into dissimilarities using the `sim2diss` function from the `smacof` package. This step is essential for performing MDS, as it requires dissimilarity data.

```r
nations.d <- sim2diss(Nations, method = 9, to.dist = TRUE) `

### 4\. Non-Metric Multidimensional Scaling

With the dissimilarities computed, the script performs Non-Metric MDS using the `isoMDS` function from the `MASS` package. The stress value is also checked, where a lower value indicates a better fit.

r

Copy code

`nations_mds <- isoMDS(nations.d)`

### 5\. Plotting MDS Coordinates

The script plots the coordinates of the first two dimensions obtained from the MDS analysis. This visual representation helps in understanding how countries relate to each other in the reduced dimensional space.

r

Copy code

`plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", main="Metric MDS", type="n")
text(x, y, labels = colnames(Nations), cex=.7)`

### 6\. Shepard Plot for Goodness of Fit

Finally, the script generates a Shepard plot to visualize the goodness of fit. This plot compares the dissimilarities against the distances between points in the MDS configuration.

r

Copy code

`plot(nations_shep, pch = 20, xlab = "Dissimilarity", ylab = "Distance", col= "gray", main = "Shephard's Diagram")
lines(nations_shep$x, nations_shep$yf, type = "S")`

Usage
-----

To run this script, load the required packages and ensure the dataset (`Nations`) is available in your R environment. Execute the script in an R environment to perform the MDS analysis and generate the plots.

Dependencies
------------

-   `psych`
-   `smacof`
-   `MASS`

Install the dependencies using the following command:

r

Copy code

`install.packages(c("psych", "smacof", "MASS"))`
