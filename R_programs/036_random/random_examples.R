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

