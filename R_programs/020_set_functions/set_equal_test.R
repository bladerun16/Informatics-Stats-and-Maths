# test program for set_equal
source("set_subset.R")
source("set_equal.R")
x <- c(2,3,6,4)
#y <- c(4,6,3,2)
y=4
cat("x=",x," y=",y," x==y? ",set_equal(x,y))