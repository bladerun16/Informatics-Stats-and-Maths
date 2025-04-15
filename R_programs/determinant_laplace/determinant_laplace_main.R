rm(list = ls())
# setwd("~/Dropbox/Didattica/Informatics/0_R/R-class")
source('determinant_laplace.R')
source('../rref/rref.R')
n <- 12
A <- matrix(as.double(sample(-1:1,n^2,T)), nrow = n)
cat("Sparsity",sum(as.vector(A)==0)/length(A)*100,"\n")
#print(A)
ptm <- system.time(dL <- determinantLaplace(A))
cat("Time determinant Laplace", ptm[3],"\n")
ptm <- system.time(d <- det(A))
cat("Time determinant standard library", ptm[3],"\n")
# cat(
#   "Value with Laplace ", dL,
#     "\nValue with standard", d)
scale <- 1
ptm <- system.time(rrefA <- myRref(A))
cat("Time myRref", ptm[3],"\n")
