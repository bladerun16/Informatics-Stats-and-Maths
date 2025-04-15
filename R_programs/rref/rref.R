# ##################################### #
# Row Reduced Echelon Form              #
#                                       #
# Transformation of a matrix using the  #
# elementary row operations on matrices #
# ##################################### #
# The global variable "scale" is manipulated
# by the elementary row operations
# to cumulate the value of the determinant.
# This feature is obviously valid only for square matrices
scale <- 1 # global variable
# ##################################### #
# Elementary row operations on matrices #
# ##################################### #
# 
# ##################################### #
# Row swap                              #
#                                       #
# swap rows i and j of matrix m         #
# ##################################### #
row_swap <- function(m, i, j){
  if (i > nrow(m) | j > nrow(m)){
    return(NULL)
  }
  temp <- m[i,]
  m[i,] <- m[j,]
  m[j,] <- temp
  scale <<- -scale # update the global variable
  return(m)
} # row_swap: end

# ##################################### #
# Scalar multiplication                 #
#                                       #
# multiply row i of matrix m            #
# with the multiplier alpha             #
# ##################################### #
scalar_multiply <- function(m, i, alpha){
  if (i > nrow(m)){
    return(NULL)
  }
  m[i,] <- m[i,] * alpha
  scale <<- scale / alpha # update the global variable
  return(m)
} # scalar_multiply: end

# ##################################### #
# Row combination                       #
#                                       #
# add to row i the row j multiplied     #
# by alpha                              #
# ##################################### #
row_combine <- function(m, i, j, alpha){
  if (i > nrow(m) | j > nrow(m)){
    return(NULL)
  }
  m[i,] <- m[i,] + m[j,] * alpha
  return(m)
} # row_combination: end

# ##################################### #
# Find next pivot                       #
#                                       #
# find next pivot in the portion of     #
# matrix starting from start_row, start_col #
# ##################################### #
# Use:
# - r: row index
# - pivot: column index
# Algorithm
# - if start_row or start_col are out of matrix return null
# - repeat varying pivot for all columns starting from start_col
#   - repeat varying r for all rows starting from start_row
#     - if element r, pivot of m is non zero 
#       - the pivot is found, return its indexes r and pivot
# - if we arrive here it means that the portion of matrix
#   is all zero and there is no pivot, then return null
find_next_pivot <- function(m, start_row, start_col){
  norow <- nrow(m)
  nocol <- ncol(m)
  if (start_row > norow | start_col > nocol) {
    return(NULL)
  }
  for (pivot in start_col:nocol){
    for (r in start_row:norow){
      if (m[r,pivot] != 0){
        return(list(row=r, pivot=pivot))
      } # if (m[i,pivot] != 0)
    } #for (pivot in start_col:nocol)
  } # for (i in start_row:norow)
  return(NULL)
} # find_next_pivot: end

# #################################
# myRref - my row reduced echelon form #
# #################################
# theory
# 1. among the nonzero entries choose one of the leftmost
#    and switch its row with the first one
# 2. combining scalar multiplication and row combination,
#    reduce to zero all the entries below the chosen element
# 3. consider the matrix obtained by forgetting about the first row and repeat
#    steps 1. and 2.
# parameters
#   m matrix of numbers
# use
#   pivot: the column of the current pivot, initialized to 1
#   norow, nocol: number of rows and columns in the matrix
#   r: index of the row under consideration
#   i: index to look for nonzero in current pivot column
# Algorithm:
# - initialize pivot to 1
# - get norow and nocol from m matrix dimensions
# - repeat varying r over rows of m
#   - find next pivot in the portion of matrix starting 
#     from r, pivot, store the pair of indexes in pivot_rc
#   - if pivot_rc is null 
#     - terminate the loop
#   - store the components of pivot_rc in i,pivot
#   - swap rows i and r (row swapping)
#   - divide the pivot row (now r) by the pivot element 
#     to obtain a pivot equal to 1 (scalar multiplication)
#   - all the rows but r (the current pivot row) are linearly
#      combined with the row r
#      the linear combination is such that
#      all the elements to above and below
#      the current pivot are set to zero
#   - increment pivot by one
# return m
#
myRref <- function(m) {
  scale <<- 1 # initialize the global variable for 
               # the computation of the determinant
  pivot <- 1 # start looking for pivot in first column
  norow <- nrow(m) # number of rows in m
  nocol <- ncol(m) # number of columns in m
  for (r in 1:norow) {
    pivot_rc <- find_next_pivot(m, r, pivot)
    if (is.null(pivot_rc)){
      scale <<- 0 # if there are null rows 
                   # the determinant goes to 0
      break
    }
    # pivot_rc has two components: row and pivot
    i <- pivot_rc$row
    pivot <- pivot_rc$pivot
    if (i != r){ # row swap to put pivot in row r
      m <- row_swap(m, i, r)
    }    
    # scalar multiplication to set pivot to 1
    m <- scalar_multiply(m, r, 1/m[r, pivot])
    # set to zero the pivot column in rows different from r
    for (i in 1:norow) {
      # linear combination of rows
      # all the rows but the current pivot row are linearly
      # combined with the current pivot row
      # the linear combination is such that all the elements to the left
      # and below the current pivot remain zero
      # and the pivot is the only nonzero in its column
      if (i != r){
        m <- row_combine(m, i, r, -m[i, pivot])
      }
      # m[i, ] <- m[i, ] - m[r, ] * m[i, pivot]
    } # for (i in (1:norow))
    pivot <- pivot + 1 # increment the pivot, to start next
    # loop execution looking for a pivot at the immediate
    # right of the last one
  } # for (r in 1:norow)
  return(m)
} # myRef - end
