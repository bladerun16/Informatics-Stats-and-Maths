# Monte Carlo method to compute the area of an ellipse

# Define the function to check if a point (x, y) is inside the ellipse
is_inside_ellipse <- function(x, y, a, b) {
  ((x^2) / (a^2)) + ((y^2) / (b^2)) <= 1
}

# Define the Monte Carlo simulation function
monte_carlo_ellipse_area <- function(n_simulations, a, b) {
  count_inside <- 0
  
  for (i in 1:n_simulations) {
    # Generate random points within the bounding box of the ellipse
    x <- runif(1, -a, a)
    y <- runif(1, -b, b)
    
    # Check if the random point is inside the ellipse
    if (is_inside_ellipse(x, y, a, b)) {
      count_inside <- count_inside + 1
    }
  }
  
  # Calculate the area of the ellipse based on the proportion of points inside the ellipse
  area_ratio <- count_inside / n_simulations
  total_area <- 4 * a * b
  estimated_area <- total_area * area_ratio
  
  return(estimated_area)
} # monte_carlo_ellipse_area - end

# Define the Monte Carlo simulation function
monte_carlo_ellipse_area_vec <- function(n_simulations, a, b) {
  x <- runif(n_simulations, -a, a)
  y <- runif(n_simulations, -b, b)
  e <- ((x^2) / (a^2)) + ((y^2) / (b^2)) <= 1
  # Calculate the area of the ellipse based on the proportion of points inside the ellipse
  area_ratio <- length(e) / n_simulations
  total_area <- 4 * a * b
  estimated_area <- total_area * area_ratio
    
  return(estimated_area)
} # monte_carlo_ellipse_area - end

# Define the parameters of the ellipse
a <- 3  # semi-major axis
b <- 2  # semi-minor axis
n_simulations <- 1000000  # number of Monte Carlo simulations

# Compute the estimated area of the ellipse
estimated_area <- monte_carlo_ellipse_area_vec(n_simulations, a, b)
cat("Estimated area of the ellipse:", estimated_area, "\n")
