
# Assignment 3 - Fictional 2016 Presidential Poll Data
# Note: This data is made up and does NOT reflect real election results

# Candidate names
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

# Poll results from ABC and CBS
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine data into a data frame
poll_data <- data.frame(Name, ABC_poll, CBS_poll)

# Add a column to compare differences between polls
poll_data$Difference <- CBS_poll - ABC_poll

# View the data
print(poll_data)

# Optional: Simple bar plot comparison
barplot(
  t(as.matrix(poll_data[, c("ABC_poll", "CBS_poll")])),
  beside = TRUE,
  names.arg = poll_data$Name,
  col = c("gray70", "gray40"),
  legend.text = c("ABC Poll", "CBS Poll"),
  main = "Fictional 2016 Presidential Poll Results",
  ylab = "Poll Percentage"
)
