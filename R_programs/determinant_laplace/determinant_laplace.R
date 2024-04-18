# ##############################
# topZeroRC                    #
# ##############################
# finds the row or column of a square matrix
# for which the number of zeros is maximum
# returns a list with the row/column index and 
#   T if the topZero is a row, F if it is a column
# Parameters:
#  a square matrix
# Output:
#   lineN number of line with maximum number of zeros
#   byRow T if the top line is a row, F if it is a column
# Use:
#   topNZeroR maximum number of zeros in a row
#   topZeroR row with maximum number of zeros
#   topNZeroC maximum number of zeros in a column
#   topZeroC column with maximum number of zeros
#   nZero numbero of zeros in a line
#     
# Algo:
#   set the temporary topNZeroR to 0
#   set the temporary topZeroR to 1
#   repeat varying i on the rows of the matrix
#     set nZero to 0
#     repeat varying j on the columns of the matrix
#       if element i,j of a is zero 
#         increment nZero by 1
#     if nZero is greater than topZeroNR
#       set topNZeroR to nZero
#       set topZeroR to i
#   set the temporary topNZeroC to 0
#   set the temporary topZeroC to 1
#   repeat varying j on the cols of the matrix
#     set nZero to 0
#     repeat varying i on the rows of the matrix
#       if element i,j of a is zero 
#         increment nZero by 1
#     if nZero is greater than topZeroNC
#       set topNZeroC to nZero
#       set topZeroC to i
#   if topNZeroR >= than topNZeroC 
#      return byRow T 
#      return topNZeroR
#   else 
#      return byRow F
#      return topNZeroC
#
#
topZeroLine <- function(a){
  if (nrow(a)!=ncol(a))
    return(NULL) # if matrix is not square return NULL
  topZeroR <- 1
  topNZeroR <- 0
  for (i in 1:nrow(a)){
    nZero <- 0
    # compute number of zeros in row i
    for (j in 1:ncol(a)){
      if (a[i,j] == 0)
        nZero = nZero + 1
    }
    if (nZero > topNZeroR){ #update if new top value
      topNZeroR <- nZero
      topZeroR <- i
    }
  }
  # find col with top number of zeros
  topZeroC <- 1
  topNZeroC <- 0
  for (j in 1:ncol(a)){
    nZero <- 0
    # compute number of zeros in col j
    for (i in 1:nrow(a)){
      if (a[i,j] == 0)
        nZero = nZero + 1
    }
    if (nZero > topNZeroC){ #update if new top value
      topNZeroC <- nZero
      topZeroC <- j
    }
  }
  if (topNZeroR >= topNZeroC){
    # the line with top number of zeros is a row
    byRow <- T
    lineN <- topZeroR
  } else { 
    # the line with top number of zeros is a column
    byRow <- F
    lineN <- topZeroC
  }
  return(list(lineN = lineN, byRow = byRow))
} # topZeroLine: end
# Alternative
# which.is.max(apply(A,1,function(x) sum(x==0)))

# ############################################
# seqHole - produces a sequence with a hole
# example: seqHole(4,2) -> 1,3,4
seqHole <- function(n # ending value of the sequence
                    , k # position of the hole, must be 
                        # between 1 and n
                    ){
  return((1:n)[which((1:n)!=k)])
} # end: seqHole

# ############################################
# minorOfMatrix - given a matrix A produces the minor w.r.t. ij
# 
minorOfMatrix <- function(A, i, j){
#  n <- nrow(A)
#  return(A[seqHole(n,i),seqHole(n,j)])
  return(A[-i,-j])
} # end - minorOfMatrix

# ############################################
# determinantLaplace - given a matrix A computes its determinant
#                      with the Laplace expansion formula
# variant w.r.t. the classic formula:
#   works only for matrices with size>=2, the base case is for n=2
determinantLaplace <- function(A # a square matrix with nrow >= 2
#                               , k = 1 # row/column w.r.t. expand
#                               , byRow = F # expansion along a row/column
                               ){
  # base case
  if (nrow(A) == 2)
    return(A[1,1]*A[2,2] - A[1,2]*A[2,1]) # exit with base case
  # initializations
  best <- topZeroLine(A)
  d <- 0 # initialize summation
  sign <- (-1)^(best$lineN+1) # initialize sign
  if(best$byRow){ # expansion along k row
    for(j in 1:nrow(A)){ # scan elements of best$lineN-th row
      if (A[best$lineN,j] != 0) # optimization: if current element is zero does not recur
        d <- d + sign * A[best$lineN,j] * 
          determinantLaplace(minorOfMatrix(A,best$lineN,j))
      sign <- sign * -1 # sign for next element in row/column changes
    } # end: for(j in 1:nrow(A))
  } else { # expansion along best$lineN column
    for(j in 1:nrow(A)){ # scan elements of best$lineN-th column
      if(A[j,best$lineN] != 0) # optimization: if current element is zero does not recur
        d <- d + sign * A[j,best$lineN] * 
          determinantLaplace(minorOfMatrix(A,j,best$lineN))
      sign <- sign * -1 # sign for next element in row/column changes
    } # end - for(j in 1:nrow(A))
  } # end - if(byRow) else
  return(d)
} # end - determinantLaplace