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
w <- 4 # width of each printing area
n <- as.integer(readline("Insert integer "))
for (i in 1:n){ #external loop
  for (j in seq_len(n-i)) # internal loop for spaces
    cat(format("",width = w))
  for (j in 1:i) # internal loop for numbers
    cat(format(j, width = w))
  cat("\n")
} # for (i in 1:n) - end