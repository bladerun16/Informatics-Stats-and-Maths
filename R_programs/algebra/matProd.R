rm(list = ls())
# This implementation of the product of matrices
# is provided only for teaching purposes.
# In real projects using R everyone will use the native operator
# for product of matrices
#
# A %*% B
#
# parameters
# A, B, matrices to multiply
# use
# m, p, n: relevant dimensions of matrices
# i, j, k: indexes to drive loops
# output C: product matrix
# extract number of rows and columns from the
#        two matrices passed as parameters
# if the dimensions are not compatible return NULL
# create C as an empty double vector of dimension m*p
# repeat for each row i of A # scan output rows
#   repeat for each column j of B # scan output columns
#     initialize to zero element i,j of C
#     repeat for each column k of A # scan input
#       add A[i,k]*B[k,j] to C[i,j]
# return C
#
#
matProd <- function (A, B) {
  m <- dim(A)[1] # extracts number of rows of A
  n <- dim(A)[2] # extracts number of columns of A
  p <- dim(B)[2] # extracts number of columns of B
  if (dim(B)[1] != n)
    # compare n with number of rows of B
    return(NULL) # if dimensions not compatible return NULL
  C <- vector(mode = "double", length = m * p)
  dim(C) <- c(m, p) # the vector is reshaped into a matrix
  # C <- matrix(nrow = m, ncol = p) equivalent
  for (i in seq_len(m)) {
    # for each row of A
    for (j in seq_len(p)) {
      # for each column of B
      C[i, j] <- 0 # initialize the summation
      for (k in seq_len(n)) {
        # compute the summation
        C[i, j] <- C[i, j] + A[i, k] * B[k, j]
      }
    }
  }
  return(C)
}

M1 <- matrix(c(1, 1, -3, -1, 0, 2), nrow = 2, ncol = 2)
M2 <- matrix(c(0, -1, 2, 0, -1, 0, 1, 1, 1)
             , nrow = 3, ncol = 3)
M <- matProd(M1, M2)
if (is.null(M)) {
  print("Dimensions not compatible")
} else {
  print(M)
}
