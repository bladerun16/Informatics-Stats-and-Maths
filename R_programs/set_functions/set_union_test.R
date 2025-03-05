rm(list = ls())
# test program for set_diff
source("set_union.R")
source("set_unique.R")
x <- c(3,8,4)
y <- c(14,22,8)
cat(x," union ",y, " = ",set_union(x,y))