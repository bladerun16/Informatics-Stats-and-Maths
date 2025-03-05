# Use x, n, t, ex, 
# Input x and n
# t <- 1
# ex <- t
# Repeat n times varying i from 1 to n
#    t <- t * x / i
#    ex <- ex + t
# Output ex
cat("Computation of exponential with MacLaurin series\n")
x <- as.double(readline("Insert x "))
n <- as.integer(readline("Insert the number of terms to use "))
t <- 1
ex <- t
for(i in seq_len(n)){
  t <- t * x / i
  ex <- ex + t
}
cat("Exponential of ",x," with ",n,
    " MacLaurin terms: ",ex,"\n")