###############################
# test program for Echelon
# #############################
rm(list = ls())
source("isRref.R")
source('rref.R')

n1 <- 4
n2 <- 4
m <- matrix(sample(-3:3, n1*n2, replace = TRUE), nrow = n1)
# m <- matrix(runif(n^2, -3, 3), nrow = n)
# print(m)
mr <- myRref(m)
# print(mr)
print(paste("The scale is      ",scale))
print(paste("Is echelon      ? ",isEchelon(clean(mr))))
print(paste("Is rref         ? ",isRref(clean(mr))))
if (n1==n2){
  print("Compare the result with the `official` determinant value")
  print(paste("The determinant is",det(m)))
}
print(mr)

