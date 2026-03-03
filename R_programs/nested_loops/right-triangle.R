# Left triangle
# Use
# - i, j : indexes
# - n: size
# - width: space for each number
# Algorithm:
# repeat varying i from 1 to n
#   repeat varying j from 1 to n-i
#     output width spaces
#   repeat varying j from 1 to i
#     output j using width spaces in the current line
#   go to new line
# 
rm(list = ls())
width = 2
n = 5
for (i in 1:n){
  for (j in seq_len(n-i)){
    cat(format(" ", width = width))
  }
  for (j in 1:i){
    cat(format(j, width = width))
  }
  cat("\n")
}