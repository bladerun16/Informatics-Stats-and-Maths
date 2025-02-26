rm(list=ls())
# Use n: number of rows
#     i: counter for rows
#     j: counter for columns
# Input n
# Repeat varying i 1 to n
#   Repeat varying j 1 to i
#     Output j
#   Go to new line
n <- as.integer(readline("Insert integer "))
w <- 3
row <- ""
for (i in 1:n){
  row <- paste(row, format(i,width = w))
  cat(row,"\n")
} # for (i in 1:n) - end
