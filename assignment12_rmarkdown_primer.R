# Assignment #12 - R Markdown Primer
# Author: Abdulrahman Elsayed
# Date: 2026-04-12

# --------------------------------------------------
# Introduction
# This script supports an R Markdown assignment by
# showing simple code that can be embedded in an .Rmd
# file and then knitted to HTML.
# --------------------------------------------------

# Load library
library(ggplot2)

# Load dataset
data(mtcars)

# View the first few rows
head(mtcars)

# Summary statistics
summary(mtcars)

# Create a simple plot
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(
    title = "Miles per Gallon vs. Car Weight",
    x = "Weight",
    y = "Miles per Gallon"
  )

# Additional note:
# Inline math example for the R Markdown write-up:
# alpha + beta = gamma
#
# Displayed equation example for the R Markdown write-up:
# xbar = (1/n) * sum(x_i)
