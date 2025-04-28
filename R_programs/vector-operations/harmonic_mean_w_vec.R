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
N=1000000000
a <- c( 30,50 )

tml <- system.time({
  s <- 0
  i <- 1
  for ( i in seq_along(a) ) 
    s <- s + ( 1 / a[i] )
  
  hm_loop <- length(a) / s
})
#cat( "The harmonic mean is", hm, "\n" )
cat("Time for harmonic mean with ",N," elements: ", tml[3],"\n")
tmv <- system.time({
  s <- sum(1/a)
  hm_vec <- length(a) / s
})
#cat( "The harmonic mean with vectorized computation is", hm, "\n" )
cat("Time for vectorized harmonic mean with ",N," elements: ", tmv[3],"\n")
