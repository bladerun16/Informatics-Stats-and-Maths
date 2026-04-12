# test program for set_diff
source("set_setdiff.R")
source("set_subset.R")
pos <- c(3,8,4)
neg <- c(14,22,8)
cat(pos," minus ",neg, " = ",set_setdiff(pos,neg))