# use v:      vector of values,
#     target: value to be found
#     found:  integer, 0 if not found, 
#                 between 1 and length of v if found
#       i: index on v
# Algo:
# - input target
# - set found to 0
# - repeat varying i from 1 to length of v
#   - if the position i of v is equal to target
#     - set found to i and stop repeating
# - if found is zero 
#   - display not found
# - else 
#   - display the value of found
#data
colors <- c("Red", "Blue", "Green", "Orange")
#input
target <- readline("Insert target color ")
#initialize
found <- 0
i <- 1
#search loop, stop when all position are examined or found is nonzero
while (i <= length(colors) & found == 0){
  if (colors[i]==target){
    found <- i #when target is found, store position in i
  }
  i <- i + 1
}
#output
cat(target) # output target value
if (found != 0){
  cat(" not found")
} else {
  cat(" found in position ",found)
}