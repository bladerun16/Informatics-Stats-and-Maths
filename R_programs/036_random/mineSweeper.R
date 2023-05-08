# minesweeper 20x20 with 5% bombs (20)
# generate a vector of size 20*20, put randomly
# the bombs and transform it into a matrix
mfs <- list(x = 6, y = 6) # mine field sizes
n <- mfs$x * mfs$y
p <- 0.2 # probability of mine
# prepare the vector of falses, no bombs at the beginning
v2 <- rep(0, n)
# generate indexes of bomb places
# sampling among all the positions a number of positions
# equal to the number of desired bombs
it <- sample.int(n = n, 
                 size = as.integer(p*n+0.5), 
                 replace = F)
# set to true the positions where bombs are placed
v2[it] <- 1
# transform the vector of positions into a matrix
mf <- matrix(v2, nrow = mfs$x)
# display the matrix
print(mf)
