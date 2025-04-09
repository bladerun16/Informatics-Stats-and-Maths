# ###############################
# GCD - Greatest Common Divisor #
# ###############################
# The recursive Euler's formula
# The gcd of a and b:
# - is 0 if b is 0
# - otherwise it is the gcd of b and the remainder of the integer division a/b
# Solution: recursive programming using the %% operator for integer division
rm(list = ls())
gcd <- function(a, b) {
  if (b == 0) {
    return(a)
  } else {
    return(gcd(b, a %% b))
  }
}

top <- .Machine$integer.max
results <- data.frame(matrix(ncol=3,nrow=0))
colnames(results) <- c("a", "b", "gcd")
n_trials = 100
for (i in 1:n_trials)
  {pair <- sample.int(top,2)
  gcd_ <- gcd(pair[1],pair[2])
  results[nrow(results)+1,] <- c(pair[1],pair[2],gcd_)
}
print(results)
