############################################################
# Module 11 - Debugging Assignment
# Author: Your Name
# Description: Fix logical bug in Tukey multiple outlier function
############################################################

# -------------------------------
# Helper Function: Tukey Outlier
# -------------------------------
tukey.outlier <- function(x, k = 1.5) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  x < (q1 - k * iqr) | x > (q3 + k * iqr)
}

# -------------------------------
# Original Buggy Function
# -------------------------------
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))

  for (j in 1:ncol(x)) {
    # BUG: uses && instead of &
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }

  outlier.vec <- vector("logical", length = nrow(x))

  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }

  return(outlier.vec)
}

# -------------------------------
# Reproduce the Error
# -------------------------------
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

cat("Running buggy function:\n")
buggy_result <- tryCatch(
  tukey_multiple(test_mat),
  warning = function(w) {
    message("Warning: ", conditionMessage(w))
    NULL
  },
  error = function(e) {
    message("Error: ", conditionMessage(e))
    NULL
  }
)

# -------------------------------
# Corrected Function (Fixed)
# -------------------------------
corrected_tukey <- function(x) {

  # Defensive checks
  if (!is.matrix(x)) {
    stop("x must be a matrix.")
  }

  if (!is.numeric(x)) {
    stop("x must be a numeric matrix.")
  }

  outliers <- array(TRUE, dim = dim(x))

  for (j in seq_len(ncol(x))) {
    # FIX: element-wise logical operator
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }

  outlier.vec <- logical(nrow(x))

  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }

  return(outlier.vec)
}

# -------------------------------
# Validate Fix
# -------------------------------
cat("\nRunning corrected function:\n")
corrected_result <- corrected_tukey(test_mat)
print(corrected_result)

cat("\nLength of output:\n")
print(length(corrected_result))
