# ------------------------------------------------------------
# hospital_analysis.R
# Hospital patient intake dataset: plots + brief summaries
# ------------------------------------------------------------

# ---- 1) Create the dataset ----

Freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BP   <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)

# first: bad = 1, good = 0, NA = missing
First <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)

# second: low = 0, high = 1
Second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)

# finaldecision: low = 0, high = 1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)

hospital_data <- data.frame(Freq, BP, First, Second, FinalDecision)

print("Hospital dataset:")
print(hospital_data)

# ---- 2) Boxplot: Blood Pressure by Final Decision ----

boxplot(
  BP ~ FinalDecision,
  data = hospital_data,
  names = c("Low Priority (0)", "High Priority (1)"),
  main = "Blood Pressure by Final Emergency Decision",
  ylab = "Blood Pressure"
)

# ---- 3) Histogram: Blood Pressure Distribution ----

hist(
  hospital_data$BP,
  main = "Histogram of Patient Blood Pressure",
  xlab = "Blood Pressure",
  col = "lightgray",
  breaks = 5
)

# ---- 4) Numeric summaries ----

summary(hospital_data$BP)
tapply(hospital_data$BP, hospital_data$FinalDecision, median)
tapply(hospital_data$BP, hospital_data$FinalDecision, mean)

