rm(list = ls())
# ################## #
# giniConcIdx        #
# ################## #
# - use X: vector of values
#       t: sum of values of vector
#       q: partial sum from position 1 to i
#       g: final value of the index
#       n: number of values
#       i: index
# - initialize to 0 q, g, t
# - repeat varying i from 1 to length of X
#   - add i-th position of X to t
# - repeat varying i from 1 to length of X -1
#   - q <- q + 1-th position of X
#   - g <- g + q
# - g <- 1 - 2 * g / (t * (length - 1))
# - output g

giniConcIdx_long <- function(v){
  # initialization
  q <- vector(mode = "double")
  g <- 0
  n <- length(v)
  q[1] <- v[1]
  # computation of cumulates
  for (i in seq_len(n-1)) {
    q[i+1] <- q[i] + v[i+1]
  }
  # now t is the sum of all the v
  # it will be used for computing the relative values
  # Computation of the summation
  for (i in seq_len(n-1)){
    g <- g + q[i]
  }
  # finalization
  t <- q[n]
  g <- 1 - 2 * g /(t*(n-1))
  return(g)
} # giniConcIdx - end

# *** test program ***
# incomes <- c(100, 100, 100, 100, 100)
# incomes <- seq(100,180,40)
# incomes <- c(10,100,1000,10000,100000)
# incomes <- c(10,10,100000)
incomes <- c(10,20,30,40,400)
g <- giniConcIdx_long(incomes)
cat("The Gini concentration index is ", g)
