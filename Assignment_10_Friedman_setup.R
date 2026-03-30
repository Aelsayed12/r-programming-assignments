# Friedman Package Setup Script
# Author: Abdulrahman Elsayed
# Purpose: Create and scaffold the Friedman R package for Assignment #10

# Install packages if needed
required_packages <- c("devtools", "usethis")
to_install <- required_packages[!required_packages %in% installed.packages()[, "Package"]]
if (length(to_install) > 0) {
  install.packages(to_install)
}

library(devtools)
library(usethis)

# Create package skeleton
create("Friedman", open = FALSE)

# Move into package directory
setwd("Friedman")

# Write DESCRIPTION file
description_text <- "
Package: Friedman
Title: Tools for Simple Data Analysis and Visualization
Version: 0.0.0.9000
Authors@R: 
    person(\"Abdulrahman\", \"Elsayed\", email = \"your_email@example.com\", role = c(\"aut\", \"cre\"))
Description: 
    The Friedman package provides simple tools for data analysis,
    cleaning, summarization, and visualization in R. It is designed
    for students and beginner analysts who want easy functions for
    exploring datasets, generating summary statistics, and creating
    basic plots for reports and assignments.
Depends: 
    R (>= 3.1.2)
Imports: 
    ggplot2,
    dplyr
License: CC0
LazyData: true
URL: https://github.com/yourusername/Friedman
BugReports: https://github.com/yourusername/Friedman/issues
Suggests: 
    knitr,
    rmarkdown,
    testthat
VignetteBuilder: knitr
Encoding: UTF-8
RoxygenNote: 7.3.2
"
writeLines(description_text, "DESCRIPTION")

# Create a simple package function
dir.create("R", showWarnings = FALSE)

function_text <- '
#\\' Calculate summary statistics for a numeric vector
#\\'
#\\' @param x A numeric vector.
#\\' @return A data frame with mean, median, standard deviation, minimum, and maximum.
#\\' @export
summary_stats <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be numeric")
  }

  data.frame(
    mean = mean(x, na.rm = TRUE),
    median = median(x, na.rm = TRUE),
    sd = sd(x, na.rm = TRUE),
    min = min(x, na.rm = TRUE),
    max = max(x, na.rm = TRUE)
  )
}

#\\' Clean a data frame by standardizing column names
#\\'
#\\' @param df A data frame.
#\\' @return A data frame with cleaned column names.
#\\' @export
clean_data <- function(df) {
  names(df) <- tolower(gsub(" ", "_", names(df)))
  df
}
'
writeLines(function_text, "R/functions.R")

# Create README
readme_text <- '
# Friedman

Friedman is an R package for simple data analysis and visualization.

## Features
- Clean datasets
- Generate summary statistics
- Support beginner-friendly workflows in R

## Installation
This package is currently in development.

## Example
```r
summary_stats(c(1, 2, 3, 4, 5))
```
'
writeLines(readme_text, "README.md")

# Create minimal NAMESPACE
namespace_text <- '
export(summary_stats)
export(clean_data)
'
writeLines(namespace_text, "NAMESPACE")

# Optional GitHub helper commands
cat("Package scaffold completed.\\n")
cat("Next steps:\\n")
cat("1. Open the Friedman folder in RStudio.\\n")
cat("2. Run devtools::check()\\n")
cat("3. Initialize Git and push to GitHub.\\n")
cat("Git commands:\\n")
cat("   git init\\n")
cat("   git add .\\n")
cat("   git commit -m \\"Initial package scaffold\\"\\n")
cat("   git branch -M main\\n")
cat("   git remote add origin https://github.com/yourusername/Friedman.git\\n")
cat("   git push -u origin main\\n")
