### GOAL
# compute the dot (or scalar) product of two equal-sized vectors
# (dot product = sum of products of corresponding elements)
# (e.g.: [1,2,3]*[4,5,6] = 1*4 + 2*5 + 3*6 = 4 + 10 + 18 = 32)

### PSEUDOCODE
# initialize sum to 0
# initialize i to 1
# while i is less or equal to length of any vector
#   increment sum by product of i-th elements of vectors
#   increment i by 1
# print sum

### CODE

a <- c( 1, 2, 3 )
b <- c( 4, 5, 6 )

sum <- 0
i <- 1
while ( i <= length(a) ) {
  sum <- sum + ( a[i] * b[i] )
  i <- i + 1
}
cat( "The dot product of vectors is", sum )

