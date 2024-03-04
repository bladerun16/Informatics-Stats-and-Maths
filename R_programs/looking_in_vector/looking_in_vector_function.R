rm(list=ls())
vector_search <- function(v, target) {
  # Parameters:
  # v: vector to search
  # target: target to search in vector
  # Return:
  # found: first position in v equal to target, or 0 if target not foun
  # Use:
  #     found:  integer, 0 if not found,
  #             between 1 and length of v if found
  #     i: index on v
  # Algo:
  # set found to 0
  # repeat varying i from 1 to length of v
  #    if the position i of v is equal to target
  #       set found to i and stop repeating
  # return found
  
  # initialization
  found <- 0
  # search loop
  for (i in seq_along(v)) {
    if (v[i] == target) {
      found <- i # when the current position is equal to target
      #   store current i in found
      break # when found jump out of the loop
      # the break causes the search to stop when we find the target
      # for the first time
      # Without the break the search continues to the end and    } # if
      # it returns the position of the last appearance of the target
    }
  } # for (i in seq_along(v)) 
  # comes here when the loop is finished or
  # after the jump caused by break
  # return search result
  return (found)
} # vector_search - end

# test program
# data
colors <- c("Red", "Blue", "Green", "Orange", "Green")
# input
target <- readline("Insert target color ")
found = vector_search(colors, target)
if (found==0){
  cat("Target ",target, " not found\n")
} else {
  cat("Target ",target, " found in position ", found, "\n")
}
