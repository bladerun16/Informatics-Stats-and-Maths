# ############## #
# Pi estimate    #
# ############## #
# Uses the Monte Carlo technique
# Throws random points into a square of side two centered
# into the origin and count the points included in a circle 
# with radius 1 and center in the origin
# 
# Parameters
# - nthrows 
# Uses
# - count: integer, to count the hits
#         inside the circle
# - x,y: double, coordinates of the 
#        point thrown to the target
# Algorithm
# - initialize count to 0
# - repeat nthrows times
#   - generate x and y randomly between
#     -1 and 1
#   - if x^2 + y^2 <= 1
#     - increment count by 1
# - return count / nthrows * 4
rm(list = ls())
pi_estimate <- function(nthrows = 100){
  count <- 0
  for (i in 1:nthrows){
    x <- runif(1,-1, 1)
    y <- runif(1,-1, 1)
    if (sqrt(x^2 + y^2) <= 1)
      count <- count + 1
  }
  return(4 * count / nthrows)
}


# ############## #
# Pi estimate    #
# vectorized     #
# ############## #
# Uses the Monte Carlo technique
# Throws random points into a square of side two centered
# into the origin and count the points included in a circle 
# with radius 1 and center in the origin
# 
# Parameters
# - nthrows 
# - ret - optional, if 'count' returns an integer
#         otherwise a dataframe with x,y,in_out
# Uses
# - count: integer, to count the hits
#         inside the circle
# - x,y: double vectors, coordinates of the 
#        points thrown to the target
# Algorithm:
# - Generate two uniformly distributed random vectors x,y
# - combine the two vectors as columns of a matrix
# - use the function rowNorms to compute the norms of the rows
#       and store the results in vector norms
# - norms<=1 is true for points belonging to the circle
# - sum(norms<=1) is the number of true
# - multiply by 4 and divide by the number of throws
# 
pi_estimate_vec <- function(nthrows = 100, ret = 'count'){
  m <- runif(2 * nthrows,-1, 1)
  m <- matrix(m, ncol = 2)
  norms <- sqrt(m[,1]^2+m[,2]^2)
  if (ret == 'count'){ # returns pi estimate
    count <- sum(norms <= 1)
    return(4 * count / nthrows)
  } else { # returns the data frame with the generated values
    return(data.frame(x=m[,1],y=m[,2],norm=norms))
  }
} # pi_estimate_vec


# n <- 1000000
n <- 10000
set.seed(42)
print("Running pi_estimate")
print(system.time({pi_est <- pi_estimate(n)}))
set.seed(42)
print("Running pi_estimate_vec")
print(system.time({pi_est <- pi_estimate_vec(n)}))
#pi_est <- pi_estimate(n)
cat("The estimation of PI with ", n, "throws is ")
cat(pi_est, "\n")
cat("The error is "
    , sprintf(" %.6f%%", abs(pi_est - pi) / pi * 100)
    , sep = "")

points <- pi_estimate_vec(n, "norms")
plot(x=points$x, y=points$y, 
     col=ifelse(points$norm<=1,'red','blue')
     )
