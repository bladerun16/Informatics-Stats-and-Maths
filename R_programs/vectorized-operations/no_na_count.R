### GOAL
# count the number of non-NA values in a vector
# (NA = Not Available = missing information)

### PSEUDOCODE
# initialize count to 0
# initialize i to 1
# while i is less or equal to length of vector
#   if i-th element of vector is not NA
#     increment count by 1
#   increment i by 1
# print count

### CODE

a <- c( 2, 5, 7, NA, 3, 5, NA, NA, 1 )

count <- 0
i <- 1
while ( i <= length(a) ) {
  if ( ! is.na( a[i] ) ) {
    count <- count + 1
  }
  i <- i + 1
}
cat( "The number of valid elements is", count )

