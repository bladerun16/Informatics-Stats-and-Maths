#------------------------------------------------------------
# Function: gen_corr
#
# Purpose:
#   Generates two numeric vectors x and y of length n such
#   that their Pearson correlation is equal to a chosen value c.
#
# Parameters:
#   n : desired length of the two vectors
#   c : desired Pearson correlation, where -1 <= c <= 1
#
# Returns:
#   A list containing:
#     x           : first generated vector
#     y           : second generated vector
#     correlation : empirical correlation between x and y
#------------------------------------------------------------

gen_corr <- function(n, c) {
  
  #----------------------------------------------------------
  # STEP 1: Check the validity of the inputs
  #----------------------------------------------------------
  
  # n must be at least 2 because correlation requires
  # at least two observations.
  if (n < 2) {
    stop("n must be at least 2.")
  }
  
  # c must be between -1 and 1.
  if (c < -1 || c > 1) {
    stop("c must satisfy -1 <= c <= 1.")
  }
  
  #----------------------------------------------------------
  # STEP 2: Generate the first random vector
  #----------------------------------------------------------
  
  # Generate x from a standard normal distribution.
  x <- rnorm(n)
  
  # Center x by subtracting its mean.
  x_centered <- x - mean(x)
  
  # Standardize x so that its squared length is 1.
  # This makes later calculations easier.
  x_standard <- x_centered / sqrt(sum(x_centered^2))
  
  #----------------------------------------------------------
  # STEP 3: Generate a second random vector
  #----------------------------------------------------------
  
  # Generate an auxiliary random vector z.
  z <- rnorm(n)
  
  # Center z by subtracting its mean.
  z_centered <- z - mean(z)
  
  #----------------------------------------------------------
  # STEP 4: Make z orthogonal to x
  #----------------------------------------------------------
  
  # Compute the projection of z_centered onto x_standard.
  # Since x_standard has squared length 1, the projection is:
  #
  #   projection = sum(z_centered * x_standard) * x_standard
  #
  projection <- sum(z_centered * x_standard) * x_standard
  
  # Remove the projection from z_centered.
  # The resulting vector is orthogonal to x_standard.
  z_orthogonal <- z_centered - projection
  
  # Standardize the orthogonal vector so that its squared
  # length is also 1.
  z_standard <- z_orthogonal / sqrt(sum(z_orthogonal^2))
  
  #----------------------------------------------------------
  # STEP 5: Construct y with the desired correlation
  #----------------------------------------------------------
  
  # Build y as a linear combination of:
  #   x_standard, which is perfectly correlated with x
  #   z_standard, which is uncorrelated with x
  #
  # The coefficient c determines the desired correlation.
  # The coefficient sqrt(1 - c^2) ensures the total length
  # remains standardized.
  y <- c * x_standard + sqrt(1 - c^2) * z_standard
  
  #----------------------------------------------------------
  # STEP 6: Return the result
  #----------------------------------------------------------
  
  # Return the generated vectors and their empirical correlation.
  return(list(
    x = x_standard,
    y = y,
    correlation = cor(x_standard, y)
  ))
} # gen_corr - end

# =======================================
# Generate test data

n <- 100
c <- 0.7
x_y <- gen_corr(n, c)
x <- x_y$x
y <- x_y$y
correlation <- x_y$correlation
