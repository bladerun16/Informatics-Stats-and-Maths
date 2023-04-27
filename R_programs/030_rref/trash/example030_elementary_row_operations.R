# ##################################### #
# Elementary row operations on matrices #
# ##################################### #
# 
require(matlib)
determ <- 1
# ##################################### #
# Row swap                              #
# ##################################### #
row_swap <- function(m, i, j){
  if (i > nrow(m) | j > nrow(m)){
    return(NULL)
  }
  temp <- m[i,]
  m[i,] <- m[j,]
  m[j,] <- temp
  determ <<- -determ
  return(m)
}

# ##################################### #
# Scalar multiplication                 #
# ##################################### #
scalar_multiply <- function(m, i, alpha){
  if (i > nrow(m)){
    return(NULL)
  }
  m[i,] <- m[i,] * alpha
  determ <<- determ / alpha
  return(m)
}

# ##################################### #
# Row combination                       #
# ##################################### #
row_combine <- function(m, i, j, alpha){
  if (i > nrow(m) | j > nrow(m)){
    return(NULL)
  }
  m[i,] <- m[i,] - m[j,] * alpha
  return(m)
}

# ##################################### #
# Find next pivot                       #
# ##################################### #
find_next_pivot <- function(m, norow, nocol, start_row, start_col){
  if (start_row > norow | start_col > nocol) {
    return(NULL)
  }
  for (pivot in start_col:nocol){
    for (r in start_row:norow){
      if (m[r,pivot] != 0){
      #   break
      # } else {
        return(list(row=r, pivot=pivot))
      } # if (m[i,pivot] != 0)
    } #for (pivot in start_col:nocol)
  } # for (i in start_row:norow)
  return(NULL)
}
m <- matrix(data = 
              #              c(6,2,0,4,2,0,6,0,0,3,0,0,6,-6,6,0,0,0,6,9)
              c(0,20,0,40,20,0,60,0,0,30,0,0,60,-60,60,0,0,0,60,90)
            , nrow = 5
            , byrow = TRUE
)
m
norow <- nrow(b)
nocol <- ncol(b)
# m <- matrix(data = c(0,1,1,0), nrow = 2)
np<-find_next_pivot(m, n_row, n_col, 1, 1)
str(np)
