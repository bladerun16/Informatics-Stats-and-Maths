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

n <- 10000000
a <- runif(n)
b <- runif(n)

times <- system.time({
  sum_ab <- 0
  i <- 1
  while (i <= length(a)) {
    sum_ab <- sum_ab + (a[i] * b[i])
    i <- i + 1
  }
})
cat("Timing with while        ",times,"\n")

times <- system.time({
  sum_ab <- 0
  for (i in seq_along(a)) {
    sum_ab <- sum_ab + (a[i] * b[i])
  }
})

cat("Timing with for          ",times,"\n")

times <- system.time({
  sum_ab <- sum(a*b)
})

cat("Timing with vectorisation",times,"\n")
