rm(list = ls())
source("set_unique.R")
# test program
v <- c(10,10)
# v <- c(10,20,10, 20, 30, 10, 40, 30, 10, 10, 10)
# v <- c(rep(100,10),200)
v <- c(200,rep(100,3))
# v <- vector(mode = "double")
# v <- 2
# v <- vector(mode = "double")
cat("Vector ",v," - Set ",set_unique(v),"\n")
