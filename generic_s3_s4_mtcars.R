# ============================================================
# Module: Generic Functions + S3 vs S4 (GitHub .R file)
# Dataset: mtcars
# ============================================================

# ---------- Step 1: Choose/Load a dataset ----------
data("mtcars")

cat("=== mtcars preview ===\n")
print(head(mtcars, 6))

cat("\n=== Structure / class / base type ===\n")
str(mtcars)
cat("\nclass(mtcars):\n")
print(class(mtcars))
cat("\ntypeof(mtcars):\n")
print(typeof(mtcars))
cat("\nmode(mtcars):\n")
print(mode(mtcars))
cat("\nstorage.mode(mtcars):\n")
print(storage.mode(mtcars))

# ---------- Step 2: Generic functions on the dataset ----------
cat("\n=== Generic functions examples (print, summary) ===\n")
# print() and summary() are generics that dispatch based on class
print(mtcars)
print(summary(mtcars))

cat("\nMethods available for 'print' and 'summary' (first few)\n")
print(head(methods("print"), 20))
print(head(methods("summary"), 20))

# Is mtcars an S4 object?
cat("\n=== Is mtcars S4? ===\n")
print(isS4(mtcars))  # should be FALSE (data.frame is S3)

# ============================================================
# GitHub Example 1: S3 object + method
# ============================================================

# Constructor for an S3 "student_s3" object
student_s3 <- function(name, age, gpa) {
  x <- list(name = name, age = age, GPA = gpa)
  class(x) <- "student_s3"   # Assign an S3 class
  x
}

# S3 method for the print() generic
print.student_s3 <- function(x, ...) {
  cat("Student (S3)\n")
  cat("Name:", x$name, "\n")
  cat("Age :", x$age, "\n")
  cat("GPA :", x$GPA, "\n")
  invisible(x)
}

cat("\n=== S3 example ===\n")
s3 <- student_s3("Myself", 29, 3.5)
print(s3)  # calls print.student_s3()

# If you want to check whether an S3 method exists:
cat("\nS3 method exists? (print.student_s3) ->\n")
print(!is.null(getS3method("print", "student_s3", optional = TRUE)))

# ============================================================
# GitHub Example 2: S4 class + object + method
# ============================================================

# Define an S4 class named "student"
setClass(
  "student",
  slots = list(
    name = "character",
    age  = "numeric",
    GPA  = "numeric"
  )
)

# Create an S4 object using new()
s4 <- new("student", name = "Myself", age = 29, GPA = 3.5)

cat("\n=== S4 example ===\n")
print(isS4(s4))  # TRUE
print(s4)        # default S4 show() output (until we define a custom show method)

# Define a show() method for the S4 class (show is the S4-style display generic)
setMethod(
  "show",
  "student",
  function(object) {
    cat("Student (S4)\n")
    cat("Name:", object@name, "\n")
    cat("Age :", object@age, "\n")
    cat("GPA :", object@GPA, "\n")
  }
)

cat("\n=== S4 object after custom show() method ===\n")
s4  # triggers show()

# ============================================================
# Helpful checks (S3 vs S4 + base type)
# ============================================================

cat("\n=== Quick checks ===\n")
cat("S3 class of s3: ", class(s3), "\n")
cat("Base type of s3: ", typeof(s3), "\n")
cat("Is s3 S4? ", isS4(s3), "\n\n")

cat("S4 class of s4: ", class(s4), "\n")
cat("Is s4 S4? ", isS4(s4), "\n")
# NOTE: typeof() on S4 objects isn't as meaningful; use class()/isS4() for OO system.
