rm(list = ls())
###############
# test program
source("set_intersect_fun.R")
source("set_subset_fun.R")
x <- c(1,2,3)
y <- c(3,4,5)
cat("x=",x," y=",y," Intersection=",set_intersect(x,y))
