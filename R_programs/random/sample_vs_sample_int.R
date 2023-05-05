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
n <- 100 # number of trials
p <- 0.05 # probability of true

# Example 1
v1 <- sample(x = c(T,F), size = n, 
            replace = T, prob = c(p, 1-p))
t1 <- sum(v1)

# Example 2
v2 <- rep(F, n)
it <- sample.int(n = n, 
                 size = as.integer(p*n), 
                 replace = F)
v2[it] <- T
t2 <- sum(v2)
cat('t1 =', t1, 't2 =',t2, "\n")

