# Assignment 6 - Steps 1 to 3
# Uses the uploaded file: Assignment 6 Dataset.txt

# ----------------------------
# Step 0: Install/load packages
# ----------------------------
if (!require(plyr)) install.packages("plyr", dependencies = TRUE)
library(plyr)

# -------------------------------------------------
# Step 1: Import dataset and find mean Grade by Sex
# -------------------------------------------------
# Option A: use file chooser
# students <- read.table(file.choose(), header = TRUE, sep = ",")

# Option B: use the assignment file directly
students <- read.table("Assignment 6 Dataset.txt", header = TRUE, sep = ",")

# Show dataset
print(students)

# Mean Grade using Sex as the category
students_gendered_mean <- ddply(students, "Sex", summarise, Grade.Average = mean(Grade))
print(students_gendered_mean)

# Write resulting output to a file
write.table(
  students_gendered_mean,
  file = "Students_Gendered_Mean.txt",
  row.names = FALSE,
  quote = FALSE
)

# ----------------------------------------------------------------------
# Step 2: Convert to data frame, filter names containing the letter "i"
# ----------------------------------------------------------------------
students <- as.data.frame(students)

i_students <- subset(students, grepl("i", Name, ignore.case = TRUE))
print(i_students)

# Write those filtered names to a CSV file
write.csv(i_students, file = "i_students.csv", row.names = FALSE)

# ------------------------------------------------
# Step 3: Write the filtered dataset as a CSV file
# ------------------------------------------------
# Already completed above, but included again for clarity
write.csv(i_students, file = "Filtered_Students_Names_With_I.csv", row.names = FALSE)

# Optional: message to confirm files were created
cat("Files created successfully:\n")
cat("1. Students_Gendered_Mean.txt\n")
cat("2. i_students.csv\n")
cat("3. Filtered_Students_Names_With_I.csv\n")
