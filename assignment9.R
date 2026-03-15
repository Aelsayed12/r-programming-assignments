# Assignment #9
# Name: Your Name
# Course: Your Course
# Description: Compare Base R, lattice, and ggplot2 graphics using a dataset from the Rdatasets collection.

# Load dataset
# airquality is included in the Rdatasets collection through the datasets package

data("airquality", package = "datasets")
head(airquality)

# Clean data
# Remove rows with missing values so the plots render cleanly

aq <- na.omit(airquality)

# Convert Month to a factor for grouped plots
aq$Month <- factor(
  aq$Month,
  levels = c(5, 6, 7, 8, 9),
  labels = c("May", "June", "July", "August", "September")
)

# --------------------------------------------------
# Base R Graphics
# --------------------------------------------------

# Plot 1: Scatter plot
plot(
  aq$Temp, aq$Ozone,
  main = "Base R: Temperature vs Ozone",
  xlab = "Temperature",
  ylab = "Ozone",
  pch = 19,
  col = "darkblue"
)

# Plot 2: Histogram
hist(
  aq$Wind,
  main = "Base R: Distribution of Wind",
  xlab = "Wind",
  col = "lightgray",
  border = "white"
)

# --------------------------------------------------
# Lattice Graphics
# --------------------------------------------------
library(lattice)

# Plot 3: Conditional scatter plot
xyplot(
  Ozone ~ Temp | Month,
  data = aq,
  main = "Lattice: Ozone vs Temperature by Month",
  xlab = "Temperature",
  ylab = "Ozone",
  pch = 16,
  col = "darkgreen",
  layout = c(3, 2)
)

# Plot 4: Boxplot
bwplot(
  Wind ~ Month,
  data = aq,
  main = "Lattice: Wind by Month",
  xlab = "Month",
  ylab = "Wind",
  col = "orange"
)

# --------------------------------------------------
# ggplot2 Graphics
# --------------------------------------------------
library(ggplot2)

# Plot 5: Scatter plot with smoothing
ggplot(aq, aes(x = Temp, y = Ozone, color = Month)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Ozone vs Temperature with Trend by Month",
    x = "Temperature",
    y = "Ozone"
  )

# Plot 6: Faceted histogram
ggplot(aq, aes(x = Wind)) +
  geom_histogram(binwidth = 2, fill = "steelblue", color = "white") +
  facet_wrap(~ Month) +
  labs(
    title = "ggplot2: Wind Distribution by Month",
    x = "Wind",
    y = "Count"
  )
