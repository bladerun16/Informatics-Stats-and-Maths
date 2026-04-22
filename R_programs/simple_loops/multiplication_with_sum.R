# Multiplication using only the sum
# works for any number m and for only positive integer n
# Use m, n, p
# Input m, n
# p <- 0
# Repeat n times
#    p <- p + m
# Output m, n, p

m <- as.integer(readline('insert an integer '))
n <- as.integer(readline('insert an integer '))
# initialization to the neutral value for the sum
p <- 0 
for (i in 1:n){
  p <- p + m
}
cat(m,' times ', n, ' gives ',p)
