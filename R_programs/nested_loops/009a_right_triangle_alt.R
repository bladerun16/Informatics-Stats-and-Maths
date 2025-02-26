rm(list=ls())
# Use n: number of rows
#     i: counter for rows
#     j: counter for columns
# Input n
# Repeat varying i 1 to n
#   Repeat varying j i+1 to n
#     output space
#   Repeat varying j 1 to i
#     Output j
#   Go to new line
# alternative solution: the first internal 
#     loop for spaces is substituted by
#     a single output of changing width
w <- 4
n <- as.integer(readline("Insert integer "))
for (i in 1:n){
  cat(format("", width = w*(n-i)))
  for (j in 1:i)
    cat(format(j, width = w))
  cat("\n")
}