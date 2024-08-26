# Data Analysis Repository

This repository contains scripts for performing two advanced statistical analysis techniques: Principal Component Analysis (PCA) and Non-Metric Multidimensional Scaling (MDS). Both techniques are used to reduce the dimensionality of data and to visualize relationships between variables or observations.

## Table of Contents

- [Introduction](#introduction)
- [Principal Component Analysis (PCA)](#principal-component-analysis-pca)
- [Non-Metric Multidimensional Scaling (MDS)](#non-metric-multidimensional-scaling-mds)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Dimensionality reduction techniques are essential tools in data analysis for simplifying complex datasets, improving visualization, and uncovering hidden patterns. This repository includes scripts for two widely used techniques:

1. **Principal Component Analysis (PCA)**: PCA is a statistical technique that transforms a dataset into a set of linearly uncorrelated variables called principal components. These components capture the maximum variance in the data, allowing for dimensionality reduction while retaining most of the original information.

2. **Non-Metric Multidimensional Scaling (MDS)**: MDS is a means of visualizing the level of similarity (or dissimilarity) of individual cases in a dataset. Non-metric MDS, in particular, preserves the rank order of the dissimilarities, making it useful for ordinal data.

## Principal Component Analysis (PCA)

The `pca_analysis.R` script performs Principal Component Analysis on a dataset. The key steps involved in this script are:

1. **Loading the Data**: The script starts by loading the required packages and data. It ensures the data is in the appropriate format for PCA.
   
2. **Data Transformation**: The data is transformed from long to wide format, making it suitable for correlation analysis and PCA.

3. **Handling Missing Data**: Cases with missing values are dropped due to their small proportion relative to the total dataset, minimizing potential bias.

4. **Correlation Matrix Calculation**: A correlation matrix is calculated, excluding variables collected for descriptive purposes only.

5. **PCA Construction**: The script constructs the PCA model, checks the explained variance for each component, and visualizes this through a Scree plot and a Log Eigenvalue diagram.

6. **Component Interpretation**: The script visualizes the PCA results, including scatter plots and bar plots for participant scores on the principal components.

7. **Biplot**: Finally, a biplot is created to visualize the relationship between the first two principal components and the original variables.

## Non-Metric Multidimensional Scaling (MDS)

The `mds_analysis.R` script performs Non-Metric Multidimensional Scaling on a dataset of country similarities. The key steps in this script include:

1. **Loading Packages and Data**: The script loads the necessary packages and the dataset for analysis.

2. **Data Inspection**: The dataset is checked for any coding mistakes, outliers, or missing values that could affect the analysis.

3. **Similarity to Dissimilarity Conversion**: The similarity data is converted into dissimilarities using the `sim2diss` function. This conversion is crucial for performing MDS.

4. **MDS Execution**: Non-Metric MDS is carried out using the `isoMDS` function. The stress value, an indicator of how well the MDS configuration represents the dissimilarities, is checked.

5. **Visualization**: The coordinates from the MDS analysis are plotted in a two-dimensional space, with additional visual aids such as vertical and horizontal reference lines.

6. **Shepard Plot**: A Shepard plot is generated to assess the goodness of fit, comparing the dissimilarities with the distances between points in the MDS configuration.

## Usage

To run the analysis scripts:

1. Ensure that all dependencies are installed (see [Dependencies](#dependencies) below).
2. Load your dataset into the R environment.
3. Run the scripts in your R environment.

The PCA script expects a dataset formatted for PCA, while the MDS script expects a dataset of similarity measures between entities.

## Dependencies

Both scripts require R and several R packages:

- `tidyverse`
- `reshape2`
- `psych`
- `smacof`
- `MASS`
- `ggplot2`
- `gridExtra`

Install the necessary packages using:

```r
install.packages(c("tidyverse", "reshape2", "psych", "smacof", "MASS", "ggplot2", "gridExtra"))
