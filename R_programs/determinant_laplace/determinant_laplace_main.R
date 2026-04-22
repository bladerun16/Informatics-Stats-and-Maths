# test program
# compute the determinant with
# - transformation to rref
# - Laplace formula
# - standard library
rm(list = ls())
source('determinant_laplace.R')
source('../rref/rref.R')
set.seed(42)
n <- 13
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
# scale <- 1
ptm <- system.time(myDet(A))
cat("Time myDet", ptm[3],"\n")
