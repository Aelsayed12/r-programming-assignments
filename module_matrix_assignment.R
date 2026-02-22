# Module - Matrix Operations in R
# ---------------------------------------
# Question 1
# Define matrices A and B
A <- matrix(c(2,0,1,3), ncol=2)
B <- matrix(c(5,2,4,-1), ncol=2)

# a) A + B
A_plus_B <- A + B

# b) A - B
A_minus_B <- A - B

# Print results
cat("Matrix A:\n"); print(A)
cat("\nMatrix B:\n"); print(B)
cat("\nA + B:\n"); print(A_plus_B)
cat("\nA - B:\n"); print(A_minus_B)

# ---------------------------------------
# Question 2
# Build a diagonal matrix of size 4 with diagonal values 4,1,2,3
D <- diag(c(4,1,2,3))

cat("\nDiagonal Matrix (4,1,2,3):\n"); print(D)

# ---------------------------------------
# Question 3
# Generate the requested 5x5 matrix

# Start with a 5x5 identity matrix multiplied by 3
M <- diag(3, 5)

# Replace first column (except first row) with 2
M[2:5,1] <- 2

# Replace first row (except first column) with 1
M[1,2:5] <- 1

cat("\nGenerated Matrix:\n"); print(M)

# ---------------------------------------
# Notes:
# Run this script in RStudio.
# It will print all answers clearly in the console.
