rm(list=ls())
source("set_subset.R")
# #########################################
# test program
# target <- c(10,20,50)
# target <- c(70,10,20,50)
# target <- c(10, 30, 50, 20,  60)
# container <- c(50, 20, 10, 30, 60)
target <- 2
container <- c()
cat("Is ",target," contained in ",container," ? ",set_subset(target = target, container = container))
