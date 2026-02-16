
# Matrix Algebra Assignment in R
# Determinant and Inverse of Matrices

# Step 1: Create matrices
A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Step 2: Display dimensions
cat("Dimensions of A:\n")
print(dim(A))

cat("\nDimensions of B:\n")
print(dim(B))

# Step 3: Determinant of A
cat("\nDeterminant of A:\n")
print(det(A))

# Step 4: Attempt to find inverse of A
cat("\nInverse of A (if it exists):\n")
tryCatch(
  print(solve(A)),
  error = function(e) {
    cat("Error:", e$message, "\n")
  }
)

# Step 5: Attempt determinant of B
cat("\nDeterminant of B:\n")
tryCatch(
  print(det(B)),
  error = function(e) {
    cat("Error:", e$message, "\n")
  }
)

# Step 6: Attempt inverse of B
cat("\nInverse of B:\n")
tryCatch(
  print(solve(B)),
  error = function(e) {
    cat("Error:", e$message, "\n")
  }
)

# Conclusion notes:
# - A is a 10x10 matrix but has determinant 0, so it has no inverse.
# - B is not a square matrix (10x100), so determinant and inverse are not defined.
