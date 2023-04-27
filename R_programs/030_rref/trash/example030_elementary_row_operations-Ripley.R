# ##################################### #
# Elementary row operations on matrices #
# ##################################### #
# 
require(matlib)
# ##################################### #
# Row swap                              #
# ##################################### #
row_swap <- function(m, i, j){
  if (i > ncol(m) | j > ncol(m)){
    return(NULL)
  }
  temp <- m[i,]
  m[i,] <- m[j,]
  m[j,] <- temp
  return(m)
}

# ##################################### #
# Scalar multiplication                 #
# ##################################### #
scalar_multiply <- function(m, i, alpha){
  if (i > ncol(m)){
    return(NULL)
  }
  m[i,] <- m[i,] * alpha
  return(m)
}

# ##################################### #
# Row combination                       #
# ##################################### #
row_combine <- function(m, i, j, alpha){
  if (i > ncol(m) | j > ncol(m)){
    return(NULL)
  }
  m[i,] <- m[i,] + m[j,] * alpha
  return(m)
}

# ##################################### #
# Find next pivot                       #
# ##################################### #
find_next_pivot <- function(m, norow, nocol, start_row, start_col){
  if (start_row > norow | start_col > nocol) {
    return(NULL)
  }
  for (i in start_row:norow){
    for (pivot in start_col:nocol){
      if (m[i,pivot] == 0){
        break
      } else {
        return(list(row=i, pivot=pivot))
      } # if (m[i,pivot] != 0)
    } #for (pivot in start_col:nocol)
  } # for (i in start_row:norow)
  return(NULL)
}

# n <- 3
# m0 <- matrix(data = c(0:(n^2+n-1)), nrow = n)
# m0[3,4] <- 13
# m <- m0
# m <- row_swap(m, 1, 2)
# m
# m <- scalar_multiply(m, 1, 1/m[1,1])
# m
# m <- row_combine(m, 2, 1, -m[2,1])
# m
# m <- row_combine(m, 3, 1, -m[3,1])
# m
# m <- scalar_multiply(m, 2, 1/m[2,2])
# m
# m <- row_combine(m, 1, 2, -m[1,2])
# m
# m <- row_combine(m, 3, 2, -m[3,2])
# m
# m <- scalar_multiply(m, 3, 1/m[3,4])
# m
# m <- row_combine(m, 1, 3, -m[1,4])
# m
# m <- row_combine(m, 2, 3, -m[2,4])
# m
# print(echelon(m0))

