rm(list = ls())
runif(10)

# 20 values uniformly distributed between -1 and 1
v <- runif(20, -1, 1)

# generate a square matrix 3x3 of values uniformly distributed
# between -1 and 1
n <- 3
m <- matrix(runif(n^2, -1, 1),
            nrow = n)

# generate a permutation of 1:n
v1 <- sample.int(13)

# generate two permutations and count equals
v1 <- sample.int(13)
v2 <- sample.int(13)
sum(v1 == v2)

# generate two equal permutations
seed <- 39
set.seed(seed)
v1 <- sample.int(13)
set.seed(seed)
v2 <- sample.int(13)
sum(v1 == v2)==length(v1)

# simulate tossing a coin nrep times
nrep <- 10
sample.int(2, nrep, replace = TRUE)

# simulate tossing a non-fair coin nrep times
nrep <- 10
sample.int(2, nrep, replace = TRUE, prob = c(0.9,0.1))

# extract a sample from a set of values
sample(2:12, nrep, replace = TRUE)

# #########################################
# random rotation of the x,y axes
set.seed(123)  # optional, for reproducibility

# Step 1: generate a random angle theta
theta <- runif(1, min = 0, max = 2*pi)

# Step 2: build the rotation matrix
R <- matrix(c(cos(theta), -sin(theta),
              sin(theta),  cos(theta)), 
            nrow = 2, byrow = TRUE)

# Print
print(R)

# Optional: Check properties
print(det(R))          # Should be very close to 1
print(t(R) %*% R)      # Should be very close to Identity matrix

v <- c(1,1)

# Define the 2D vector
v <- c(1.5, 2.5)  # example vector

vector_plot <- function(v){
  # Create an empty plot
  plot(0, 0, xlim = c(-3, 3), ylim = c(-3, 3), 
       xlab = "x", ylab = "y", asp = 1, 
       main = "Segment from Origin to Vector v")
  
  # Add grid for clarity
  grid()
  
  # Plot the segment
  segments(x0 = 0, y0 = 0, x1 = v[1], y1 = v[2], col = "blue", lwd = 2)
  
  # Optionally: add the vector tip
  points(v[1], v[2], pch = 19, col = "red")
  
  # Add labels
  text(v[1], v[2], labels = "v", pos = 4, col = "red")
}
vector_plot(v)
