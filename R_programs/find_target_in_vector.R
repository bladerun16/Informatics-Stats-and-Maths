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

colors <- c("Red", "Blue", "Green", "Orange")
target <- readline("Insert target color ")
found <- 0
# i <- 1
# while (i <= length(colors) & found == 0){
#   if (colors[i]==target){
#     found <- i
#   }
#   i <- i + 1
# }

for (i in seq_along(colors)){
    if (colors[i]==target){
      found <- i
      break
    }
}
cat(target)

if (found == 0){
  cat(" not found")
} else {
  cat(" found in position ",found)
  
}