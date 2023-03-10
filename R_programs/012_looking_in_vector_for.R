rm(list=ls())
# Use v:      vector of values,
#     target: value to be found
#     found:  integer, 0 if not found, 
#             between 1 and length of v if found
#     i: index on v
# Algo:
# input target
# set found to 0
# repeat varying i from 1 to length of v
#    if the position i of v is equal to target
#       set found to i and stop repeating
# if found is zero display not found
# else display the value of found
# data
colors <- c("Red", "Blue", "Green", "Orange", "Green")
# input
target <- readline("Insert target color ")
# initialization
found <- 0
# search loop
for (i in seq_along(colors)){
  if (colors[i]==target){
    found <- i # when the current position is equal to target
              #   store current i in found
    break # when found jump out of the loop
  }
}
# comes here when the loop is finished or 
# after the jump caused by break
# output target value and then the result
cat(target)
if (found == 0){
  cat(" not found")
} else {
  cat(" found in position ",found)
}

# the break causes the search to stop when we find the target
# for the first time
# Without the break the search continues to the end and
# it returns the position of the last appearance of the target
# 
# Second version of the problem: return all the positions where
# the target is found