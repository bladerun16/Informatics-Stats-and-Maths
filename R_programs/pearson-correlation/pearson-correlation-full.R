#------------------------------------------------------------
# Function: pearson_loop
#
# Purpose:
#   Computes the Pearson correlation coefficient between
#   two numeric vectors using only explicit loops.
#
# Parameters:
#   x : first numeric vector
#   y : second numeric vector
#
# Returns:
#   Pearson correlation coefficient
#------------------------------------------------------------
# Algorithm
# initialize avg x and avg y to 0
# repeat varying i along x 
#   add i-th element of x to avg x and i-th element
#       of y to avg y
# initialize num to 0
# initialize denL to 0 and denR to 0
# repeat varying i along x
#   add (xi - avg x)*(yi - avg y) to num
#   add (xi - avg x)^2 to denL
#   add (yi - avg y)^2 to denr
# correlation <- num / sqrt(denL*denR)
# return correlation
#    

pearson <- function(x, y) {
  
  # Check that vectors have the same length
  if (length(x) != length(y)) {
    stop("Vectors must have the same length.")
  }
  
  # Number of observations
  n <- length(x)
  
  # Require at least two observations
  if (n < 2) {
    stop("Vectors must contain at least two elements.")
  }
  
  #----------------------------------------------------------
  # STEP 1: Compute means manually
  #----------------------------------------------------------
  
  sum_x <- 0
  sum_y <- 0
  
# the two loops for computing the means have the same lenght and
# operate on independent variables, therefore they can be reduced to 
# a single loop
    for (i in 1:n) {
    sum_x <- sum_x + x[i]
    sum_y <- sum_y + y[i]
  }
  
  mean_x <- sum_x / n
  mean_y <- sum_y / n
  
  #----------------------------------------------------------
  # STEP 2: Compute numerator and denominator components
  #----------------------------------------------------------
  
  numerator <- 0
  sum_sq_x <- 0
  sum_sq_y <- 0
  
  for (i in 1:n) {
    
    # Deviations from means
    dx <- x[i] - mean_x
    dy <- y[i] - mean_y
    
    # Covariance-like term
    numerator <- numerator + dx * dy
    
    # Squared deviations
    sum_sq_x <- sum_sq_x + dx^2
    sum_sq_y <- sum_sq_y + dy^2
  }
  
  # Compute denominator
  denominator <- sqrt(sum_sq_x * sum_sq_y)
  
  # Prevent division by zero
  if (denominator == 0) {
    stop("Division by zero: one vector has zero variance.")
  }
  
  # Final correlation
  r <- numerator / denominator
  
  return(r)
}
