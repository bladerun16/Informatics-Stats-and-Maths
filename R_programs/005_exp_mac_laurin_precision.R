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
# x<-100
# p<-10e-4
cat("Computation of exponential with MacLaurin series\n")
x <- as.double(readline(  "Insert x "))
p <- as.double(readline(  "Insert the precision "))
t <- 1    # term
ex <- t   # result
i <- 0    # control variable
while(!is.na(t/ex) & abs(t/ex) >= p){
           # this works thanks to #shortcut evaluation
           # when the ratio is na we do not compute the second comparison
           # without this, when t and ex become Inf the ratio t/ex is NaN
           # and abs(t/ex) >= p is undefined
  i <- i + 1   # being in the beginning init value must be 0
  t <- t * x / i
  ex <- ex + t
  # if (is.na(t/ex)){
  #   break
  # }
}
cat("Exponential of ",x," with ",i,
    " MacLaurin terms: ",ex,"\n")

