# Doubling points
# the first reading is a doubling point
# next doubling point is next element whose value is not smaller 
# than the last doubling point
#' Find the doubling points in a longitudinal series of data
#'
#Param:
# - r: a series of longitudinal data
#Return:
# - The vector of indexes where the series value is the minimum 
#'         which is not less than the double
#'         of the value in the previous returned index; 
#'         the first returned index is the
#'         one where the first value of r is doubled
# Uses
# - ldp - index of the last doubling point found, initialised to 1
# Algorithm
# - set ldp to 1 
# - create an empty vector for the result
# - repeat varying i from 2 to the length of the input vector r
#   - if the i-th position of r is not less than the double 
#     of the value in the ldp position
#     - store i in the last position of the output vector
#     - store i in ldp
# - return the output vector
doublingPoints <- function(r){
  ldp <- 1 # last doubling point initialised to 1
  doubling <- vector(mode = "integer") # prepare empty vector, unknown size
  for (i in 2:length(r)){
    if (r[i] >= r[ldp] * 2){
      doubling[length(doubling)+1] <- i # add new doubling point at the end
      # also doubling <- c(doubling,i)
      ldp <- i
    }
  }
  return(doubling)
} # doublingPoints - end
