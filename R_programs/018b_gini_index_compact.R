rm(list = ls())
# ################## #
# giniConcIdx        #
# ################## #
# Compact version, merge the two loops
# - use v: vector of values
#       t: sum of values of vector
#       q: partial sum from position 1 to i
#       g: final value of the index
#       n: number of values
#       i: index
# - initialize to 0 q, g
# - repeat varying i from 1 to length of X -1
#   - q <- q + 1-th position of X
#   - g <- g + q
# - t <- q (last cumulate is the normalization factor)
# - g <- 1 - 2 * g / (t * (n - 1))
# - output g

giniConcIdx <- function(v){
  # initialization
  g <- 0
  n <- length(v)
  q <- v[1]
  # computation of cumulates and summation
  for (i in seq_len(n-1)) {
    g <- g + q
    q <- q + v[i+1]
  }
  # finalization
  t <- q
  g <- 1 - 2 * g /(t*(n-1))
  return(g)
} # giniConcIdx - end

# *** test program ***
# incomes <- c(100, 100, 100, 100, 100)
# incomes <- seq(100,200,1)
# incomes <- c(10,100,1000,10000,100000)
# incomes <- c(10,10,100000)
# incomes <- c(10,20,30,40,400)
incomes <- c(rep(0,5),100)
g <- giniConcIdx(incomes)
cat("The Gini concentration index of ",incomes," is ", g,"\n")
