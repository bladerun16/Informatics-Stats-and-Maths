rm(list = ls())
# ################## #
# giniConcIdxLong        #
# ################## #
# - use X: vector of values
#       n: number of values
#       i: index
# - initialize num to 0 (initialize the numerator)
# - initialize s to 0 (the sum of the elements of X)
# - repeat varying i from 1 to length of X
#   - repeat varying j from 1 to length of X
#     - num <- num + abs(ith element - jth element)
#   - s <- s + ith element
# - g <- num / (2 * )
# - output g

giniConcIdx_long <- function(X){
  # initialization
  n = length(X)
  if (n==0)
    return(0)
  num <- 0
  s <- 0
  for (i in seq_len(n)){
    for (j in seq_len(n))
      num <- num + abs(X[i]-X[j])
    s <- s + X[i]
  }
  g <- num / (2 * n * s)
  return(g)
} # giniConcIdx - end
# #####################################

# #####################################
# the main diagonal of the differences is 0, the two triangles are equal,
# (the absolute values of a difference does not change if you change the signs)
# therefore we can spare half of the computations
giniConcIdx_shorter <- function(X){
  # initialization
  n = length(X)
  if (n==0)
    return(0)
  num <- 0
  s <- 0
  for (i in seq_len(n)){
    for (j in seq_len(i-1))
      num <- num + abs(X[i]-X[j])
    s <- s + X[i]
  }
  g <- num / (n * s)
  return(g)
} # giniConcIdx - end
# #####################################




# ################## #
# giniConcIdxCompact #
# ################## #
# - use X: vector of values
#       n: number of values
#       s: sum of values
#       weighted_sum: weighted sum of values
#       i: index
# - initialize s to 0 (the sum of the elements of X)
# - initialize weighted_sum to 0 (the sum of the elements weighted with the rank)
# - repeat varying i from 1 to length of X
#   - weighted_sum <- weighted_sum + i * ith element of X
#   - s <- s + ith element
# - g <- (2 * weighted_sum) / (n * s) - (n + 1) / n
# - output g
giniConcIdxCompact <- function(X) {
  n <- length(X)  # Number of values
  # s <- sum(X)     # Total sum of values
  # 
  # # Compute the weighted sum of values
  # weighted_sum <- sum((1:n) * X)
  
  weighted_sum <- 0
  s <- 0
  for (i in seq_len(n)) {
    s <- s + X[i]
    weighted_sum <- weighted_sum + i * X[i]
  }
  
  # Compute the Gini coefficient using the simplified formula
  G <- (2 * weighted_sum) / (n * s) - (n + 1) / n
  
  return(G)
} 



# *** test program ***
# incomes <- c(100, 100, 100, 100, 100)
# incomes <- seq(100,180,40)
# incomes <- c(10,100,1000,10000,100000)
# incomes <- c(10,10,100000)
# incomes <- c(10,20,30,40,400)
# incomes <- vector(mode = "numeric")
nz<- 10000000
top <- 3000
# incomes <- c(rep(0,nz),top)
incomes <- sort(as.double(sample.int(top,nz,replace = T)))
# incomes <- as.double(1:top)*100
# g <- giniConcIdx_long(incomes)
# cat("The Gini concentration index is ", g, "\n")
# 
# g <- giniConcIdx_shorter(incomes)
# cat("The Gini concentration index shorter is ", g, "\n")

g <- giniConcIdxCompact(incomes)
cat("The Gini coefficient compact is ", g, "\n")

