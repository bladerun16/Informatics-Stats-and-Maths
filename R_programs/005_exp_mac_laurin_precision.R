# Use x, i, t, ex, p
# Input x and p
# t <- 1
# ex <- t
# i <- 1
# Repeat if abs(t/ex) >= p
#    t  t * x / i
#    ex  ex + t
#    i <- i + 1
# Output ex, i
rm(list = ls())
x<-100
p<-10e-4
cat("Computation of exponential with MacLaurin series\n")
# x <- as.double(readline(  "Insert x "))
# p <- as.double(readline(  "Insert the precision "))
t <- 1    # term
ex <- t   # result
i <- 0    # control variable
while(abs(t/ex) >= p){
  i <- i + 1   # being in the beginning init value must be 0
  t <- t * x / i
  ex <- ex + t
}
cat("Exponential of ",x," with ",i,
    " MacLaurin terms: ",ex,"\n")

