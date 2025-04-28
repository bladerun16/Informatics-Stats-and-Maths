### GOAL
# compute the harmonic mean of values of a vector
# (harmonic mean = reciprocal (1/x or x^-1) of mean of reciprocals)

### PSEUDOCODE
# initialize sum to 0
# initialize i to 1
# while i is less or equal to length of vector
#   increment sum by reciprocal of i-th element of vector
#   increment i by 1
# compute hm as length of vector divided by sum
# print hm

### CODE

a <- c( 30,50 )

sum <- 0
i <- 1
while ( i <= length(a) ) {
  sum <- sum + ( 1 / a[i] )
  i <- i + 1
}
hm <- length(a) / sum
cat( "The harmonic mean is", hm )

