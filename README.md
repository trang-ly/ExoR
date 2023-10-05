# ExoR

ExoR is an R package designed for conducting data analysis and visualization of exoplanet-related datasets. It provides a set of functions and tools to help explore and gain insights from exoplanet data, including parameters related to exoplanets and their host stars.

## Features

- Conduct data analysis on exoplanet datasets.
- Create a variety of plots and visualizations to understand trends and relationships.
- Perform statistical analyses to uncover patterns and correlations in the data.
- Customize visualizations and analyses to suit specific research questions.

## Installation

To install ExoR, you can use the `devtools` package in R. If you haven't installed `devtools` yet, you can do so using the following command:

```R
install.packages("devtools")
```

Once devtools is installed, you can install ExoR directly from GitHub using the following command:
```R
devtools::install_github("trang-ly/ExoR")
```

## Usage

Here's a quick example of how to use ExoR for data analysis:

```R
# Load the ExoR package
library(ExoR)

# Load the dataset
exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)

# Create custom plots and visualizations
create_scatterplot(exoplanets, pl_radj, st_rad, "Comparison of Planet Radius and Host Star Radius", "Planet Radius (in Jupiter Radii)", "Host Star Radius (in Solar Radii)", y_max_limit = 6)

# etc.
```

A complete analysis of the exoplanet data in S_2023.10.04_12.36.20.csv is available for view in the NASA_exoplanet_data_analysis.Rmd or knitted NASA_exoplanet_data_analysis.pdf file.

## Documentation

For detailed documentation on ExoR functions and their usage, including other examples, please refer to the package's documentation. You can access the documentation within R using the ? operator. For example:

```R
?create_scatterplot
```

Trang Ly <br>
lytt6@vcu.edu <br>
Created for BIOS 524 Biostatistical Computing with R Final Project