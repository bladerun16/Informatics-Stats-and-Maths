#------------------------------------------------------------
# Function: pearson_vectorized
#
# Purpose:
#   Computes the Pearson correlation coefficient using
#   fully vectorized R operations.
#
# Parameters:
#   x : first numeric vector
#   y : second numeric vector
#
# Returns:
#   Pearson correlation coefficient
#------------------------------------------------------------

pearson <- function(x, y) {
  
  # Validate input size
  if (length(x) != length(y)) {
    stop("Vectors must have the same length.")
  }
  
  if (length(x) < 2) {
    stop("Vectors must contain at least two elements.")
  }
  
  # Center vectors
  dx <- x - mean(x)
  dy <- y - mean(y)
  
  # Compute numerator
  numerator <- sum(dx * dy)
  
  # Compute denominator
  denominator <- sqrt(sum(dx^2) * sum(dy^2))
  
  # Prevent division by zero
  if (denominator == 0) {
    stop("Division by zero: one vector has zero variance.")
  }
  
  # Pearson correlation
  r <- numerator / denominator
  
  return(r)
} # pearson vectorized - end