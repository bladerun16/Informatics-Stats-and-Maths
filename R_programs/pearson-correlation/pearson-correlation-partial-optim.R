#------------------------------------------------------------
# Function: pearson_optimized
#
# Purpose:
#   Computes the Pearson correlation coefficient using
#   partial optimization:
#   - built-in mean()
#   - single loop for accumulation
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
  
  n <- length(x)
  
  if (n < 2) {
    stop("Vectors must contain at least two elements.")
  }
  
  # Compute means
  mean_x <- mean(x)
  mean_y <- mean(y)
  
  # Initialize accumulators
  numerator <- 0
  sum_sq_x <- 0
  sum_sq_y <- 0
  
  # Single loop
  for (i in 1:n) {
    
    dx <- x[i] - mean_x
    dy <- y[i] - mean_y
    
    numerator <- numerator + dx * dy
    sum_sq_x <- sum_sq_x + dx^2
    sum_sq_y <- sum_sq_y + dy^2
  }
  
  # Compute denominator
  denominator <- sqrt(sum_sq_x * sum_sq_y)
  
  if (denominator == 0) {
    stop("Division by zero: one vector has zero variance.")
  }
  
  # Correlation coefficient
  r <- numerator / denominator
  
  return(r)
}