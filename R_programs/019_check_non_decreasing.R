# ######################## #
# chech_non_decreasing     #
# ######################## #
check_non_decreasing <- function(v){
  # check non-decreasing order of a vector
  # parameter v: vector of values
  # output true or false
  # uses i: index
  # repeat varying i from 1 to length of v -1
  #   if v[i+1] < v[i]
  #      return FALSE
  # return TRUE
  for (i in seq_len(length(v)-1)){
    if (v[i+1] < v[i]){
      return(FALSE) # exit from the function returning FALSE 
    } # if we find a violation exit from the function with FALSE
  } # loop on v
  # if we come to the end of the repetition
  # without any violation the vector is non-decreasing
  return(TRUE)
} # check_non_decreasing - end

# test program
v <- c(10,20,30,15)
cat(v, check_non_decreasing(v), "\n")