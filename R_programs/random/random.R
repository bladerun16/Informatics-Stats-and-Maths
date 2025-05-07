rm(list = ls())
# roll a dice
cases <- 6
# cases <- 2
rep <- 20
seed <- 28
set.seed(seed)
v1 <- vector(length = rep)
for (i in 1:rep)
  v1[i] <- sample.int(cases,1)
print(v1)
set.seed(seed)
v2 <- sample.int(cases, rep, 
                 replace = TRUE,
                 prob = c(0.1,0.1,0.1,0.1,0.1,0.5))
print(v2)

n <- 100000
# roll a dice n times
v <- sample.int(6,n,replace = T)
plot(v, type = 'o', ylab = '')

# permutation of first n integers
v <- sample.int(n)
plot(v, type = 'o', ylab = '')

v <- runif(n)
#plot(v, type = 'o', ylab = '')
summary(v)

v <- sample(c("H","T"), 10, replace = T)
print(v)

# random integers in two separate intervals
# 1-6 and 20-24
range <- c(1:6,20:24)
v <- sample(range,30,replace = T)
plot(v, type = 'o', ylab = '')

# a hand of french playing cards
# load cards into a one column data frame (default col name V1)
fpc <- read.csv("fpc.txt", stringsAsFactors = F, header = F) 
# permutation and vector to matrix
hand <- matrix(data = sample(fpc$V1), nrow = 4) #
# sort rows
hand <- apply(hand, 1, sort)
print(hand)

# generate random numbers over two disjoint integer intervals
int1 <- 3:7
int2 <- 10:19
n1 <- 100
n2 <- 50
v <- c(sample(int1, n1, replace = T)
      ,sample(int2, n2, replace = T)
      )
v # not good: the numbers of the two intervals are separated
plot(v, type = 'o', pch = '|', ylab = '')

v1 <- sample(int1, n1, replace = T)
v2 <- sample(int2, n2, replace = T)
v <- sample(c(v1,v2)) # good: the additional shuffling 
                      # mixes the numbers of the two intervals
plot(v, type = 'o', pch = '|', ylab = '')

# uniform 0:1
v <- runif(n)
plot(v)
v <- runif(n, min = -1, max = 1)
plot(v)

# binomial
v <- rbinom(n, 10, 0.8)
plot(v)

# ################################### #
# generate a minesweeper field        #
# given the number of bombs           #
# and the size of the field           #
# ################################### #
n <- 8         # size of the field
n_bomb <- 5    # number of bombs
# - generate a vector with B and spaces
#   the number of B elements is n_bomb
# - with sample generate a random permutation
#   of the vector
# - with matrix generate the squared schema
matrix(sample(c(rep("B", n_bomb),
                rep(" ", n^2-n_bomb))
              ),
       nrow = n)


# ########################################### #
# Generate points inside a rectangle          #
# given bottom left and top right coordinates #
# ########################################### #
blx <-0
bly <-0
trx <- 2
try <- 3
n <- 10000
x <- runif(n, min = blx, max = trx)
y <- runif(n, min = bly, max = try)
plot(x,y)


# ########################################### #
# Generate a Ruzzle schema                    #
# given bottom left and top right coordinates #
# ########################################### #
ruzzle <- sample(letters,16,replace = T)
ruzzle <- matrix(ruzzle, nrow = 4)
# each letter has the same probability
print(ruzzle)

# read the file of letter probabilities
side <- 4
letter_freq <- read.csv(  "letter_freq.csv"
                          , header = FALSE
                          , sep = ";")
ruzzle <- matrix(  sample(  letter_freq$V1
                            , side^2
                            , replace = TRUE
                            , prob = letter_freq$V2
)
, nrow = side)

# 
print(ruzzle)
