rm(list = ls())
# ###############################
# test program
source("set_check.R") # since there is no path, the file
                      # must be in the same directory
# v <- c(10,20,10)
# v <- c(10,20,15)
# v <- c()
v <- 2
cat("Is ",v," a set? ",set_check(v),"\n")
