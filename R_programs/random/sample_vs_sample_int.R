# this piece of code shows an example of 
# the different results you can obtain 
# with sample and sample.int
#set.seed(29) without this the result will 
# change at every run
# 
rm(list = ls())
# warm up
t <- sum(c(T,F,T,T)) # True and False are 
                     # interpreted as 1 and 0
                     # by numeric operators and functions
# common parameters
n <- 1000000 # number of trials
p <- 0.05 # probability of true

# Example 1
# sample True or False n times with p prob of true
v1 <- sample(x = c(T,F), size = n, 
            replace = T, prob = c(p, 1-p))
# count the number of trues
t1 <- sum(v1)

# Example 2
# initialize a vector of n False
# set to True a p fraction positions in the vector randomly selected
v2 <- rep(F, n)
it <- sample.int(n = n, 
                 size = as.integer(p*n), 
                 replace = F)
v2[it] <- T
t2 <- sum(v2)
cat('t1 =', t1, 't2 =',t2, "expected = ", as.integer(p*n),
    "\n")

# we see that the in example 1 the result has a random variability
# around the expected number of True values
# example 2 gives always 