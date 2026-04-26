# use v:      vector of values,
# target: value to be found
# found:  integer, 0 if not found, 
# between 1 and length of v if found
# i: index on v
# 
# input target
# 
# set found to 0
# 
# repeat varying i from 1 to length of v
# 
# if the position i of v is equal to
# target
# 
# set found to i and stop repeating
# 
# if found is zero display not found
# 
# else display the value of found
rm(list = ls())

find_target <- function(v, target) {
  found <- 0
  
  for (i in seq_along(v)) {
    if (v[i] == target) {
      found <- i
      break
    } # if
  } # for
  return(i)
} # find_target - end


colors <- c("Red", "Blue", "Green", "Orange")
target <- readline("Insert target color ")

found <- find_target(colors,target)
cat(target)

if (found == 0){
  cat(" not found")
} else {
  cat(" found in position ",found)
}