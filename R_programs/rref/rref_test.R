###############################
# test program for myRrref    #
# #############################
rm(list = ls())
source('rref.R')

n1 <- 5
n2 <- 5
set.seed(48)
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
cat("\nBefore cleaning\n")
print(mr)
cat("\nAfter  cleaning\n")
print(clean(mr))

