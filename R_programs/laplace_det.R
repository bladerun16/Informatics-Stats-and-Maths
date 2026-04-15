# function determinant(M):
#   n = number of rows of M
#   
#   if n == 1:
#     return M[1,1]
#   
#   if n == 2:
#     return M[1,1]*M[2,2] - M[1,2]*M[2,1]
#   
#   det = 0
#   
#   for j from 1 to n:
#     subM = M without row 1 and column j
#   cofactor = (-1)^(1+j) * M[1,j]
#   det = det + cofactor * determinant(subM)
#   
#   return det
rm(list = ls())
laplace_det <- function(M) {
  n <- nrow(M)
  # Check square matrix
  if (n != ncol(M)) {
    stop("Matrix must be square")
  } # not square
  # Base cases
  if (n == 1) {
    return(M[1, 1])
  } # one element
  
  if (n == 2) {
    return(M[1,1] * M[2,2] - M[1,2] * M[2,1])
  } # 2x2
  
  det_val <- 0
  
  for (j in 1:n) {
    # Submatrix removing row 1 and column j
    subM <- M[-1, -j, drop = FALSE]
    
    cofactor <- (-1)^(1 + j) * M[1, j]
    
    det_val <- det_val + cofactor * laplace_det(subM)
  }
  
  return(det_val)
} # laplace_det

M <- matrix(data = c(1,0,0,1), nrow = 2, byrow = TRUE)
M <- matrix(data = c(0,1,1,0), nrow = 2, byrow = TRUE)
M <- matrix(data = c(2,0,0,1/2), nrow = 2, byrow = TRUE)
M <- matrix(c(1, 2, 3,
              0, 4, 5,
              1, 0, 6), nrow = 3, byrow = TRUE)
random_square_matrix <- function(n) {
  matrix(runif(n * n), nrow = n, ncol = n)
}
M <- random_square_matrix(12)
# print(M)
print(laplace_det(M))
