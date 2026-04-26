# # this piece of code shows an example of 
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
# - initialize a vector of n False
# - set to True a randomly selected fraction p of the 
#   positions in the vector 
v2 <- rep(F, n)
it <- sample.int(n = n, # the range is implicitly 1 to n
                 size = as.integer(p*n), # the amount of random positions
                                         # that will be set to True
                 replace = F # sampling without replacement
                 )
v2[it] <- T # makes the sampling by filtering the exact fraction
t2 <- sum(v2)

cat(' number of selected with "sample"     = ', t1, '\n',
    'number of selected with "sample.int" = ', t2, '\n',
    "expected number                      = ", as.integer(p*n),
    "\n")

# we see that the in example 1 the result has a random variability
# around the expected number of True values
# example 2 gives always the same frequency of T
# 
# # ==============================
# Convergence
# In order to verify that the number of T in experiment 1
# converges when we repeat it, we will repeat the experiment
# and we will store the average number of True for increasing
# number of repetitions.
# When we are not interested to repeatability we do not
# reset the seed.
# Without reseeding t1 changes, t2 is always the same
# the average t1 after a high number of runs without 
# reseeding will converge to t2
# Uses:
# - avgT: vector to store the average number of true
#         for each number of repetitions
# Algorithm:
# - repeat nPlots times varying nP
#   - set nTests to 10^nP
#   - set nP position of avgT to 0
#   - repeat nTests times 
#     - do the experiment
#     - count the number of True and sum it to the nP
#       position of avgT
#   - divide the nP position of avgT by nTests
# - plot the results using  the range nPlots as x and
#   avgT as y

# prepare common parameters and avgT
set.seed(36) # set the seed only once for the "global" 
# experiment
nPlots <- 6
p <- 0.5
n <- 100
plotRange <- 1:nPlots
avgT <- vector(mode = "numeric", length = nPlots)
# External repetition: changing the order of magnitude
for (nP in plotRange){
  nTests <- 10^nP
  avgT[nP] <- 0
  #  outcome <- vector(mode = "numeric", length = nTests)
  # Internal repetition: repeating the random experiment
  for (i in 1:nTests){
    # "local" experiment to be repeated
    # set.seed(38) # what happens if we put
    # set.seed(<any number>) here?
    v1 <- sample(x = c(T,F), size = n, 
                 replace = T, prob = c(p, 1-p))
    #    outcome[i] <- sum(v1)
    avgT[nP] <- avgT[nP] + sum(v1)
  } # for (i in 1:nTests)
  avgT[nP] <- avgT[nP] / nTests
} # for (nP in plotRange)
# https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/plot
mainTitle = paste("Convergence of repeated random experiments",
                  "\n",
                  #                  "n =", n, 
                  "p =", p, "\n",
                  "sum(sample(x = c(T,F), size = n, replace = T, prob = c(p, 1-p)))"
)
plot(x = 10^plotRange, y = avgT, type = "b",
     main = mainTitle,
     xlab = "Repetitions", 
     log = "x",
     ylab = "Average fraction of True"#,
     #     ylim = c(p*0.9,p*1.1) # adjust the y label range
)
abline(h = p) # put a horizontal line
# at the theoretical convergence point

