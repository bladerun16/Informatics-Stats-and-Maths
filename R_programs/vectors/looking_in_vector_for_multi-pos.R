rm(list=ls())
# Look for a target in a vector: returns all the positions
# found
# Use v:      vector of values,
#     target: value to be found
#     found:  vector, empty if not found, one index value
#             between 1 and length of v for each position found
#     i: index on v
# Algo:
# input target
# set found to empty vector
# repeat varying i from 1 to length of v
#    if the position i of v is equal to target
#       store i after the last position of found 
# if found is empty display not found
# else display the values of found
# 
# which is the index expression for the position after the last 
# of a vector?
# 
# data
colors <- c("Red", "Blue", "Green", "Orange", "Green")
# input
target <- readline("Insert target color ")
# initialization
found <- c()
# search loop
for (i in seq_along(colors)){
  if (colors[i]==target){
    found[length(found)+1] <- i # when the current position is equal to target
              #   store current i in found
  }
}
# comes here when the loop is finished or 
# output target value and then the result
cat(target)
if (length(found) == 0){
  cat(" not found")
} else {
  cat(" found in position ",found)
}

# Without the break the search continues to the end and
# it returns the position of the last appearance of the target
# 
