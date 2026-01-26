# -------------------------------------------
# Writing User-Defined Functions in R
# Evaluating and Correcting myMean()
# -------------------------------------------

# Data vector
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Original (incorrect) function
myMean_incorrect <- function(assignment2) {
  return(sum(assignment) / length(someData))
}

# Test the incorrect function (will produce an error)
# myMean_incorrect(assignment2)

# Corrected function
myMean <- function(assignment2) {
  sum(assignment2) / length(assignment2)
}

# Test the corrected function
myMean(assignment2)
