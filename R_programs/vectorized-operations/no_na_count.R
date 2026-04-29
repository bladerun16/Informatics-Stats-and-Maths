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
n <- 1000000
na_frac <- 0.1
a <- sample.int(n)
a[sample.int(n, size=as.integer(n*na_frac))] <- NA


count <- 0
i <- 1
while ( i <= length(a) ) {
  if ( ! is.na( a[i] ) ) {
    count <- count + 1
  }
  i <- i + 1
}
cat( "The number of valid elements is", as.integer(count),"\n" )

cat( "The number of valid elements is", sum(!is.na(a)),"\n" )


