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
for (i in 1:n){ #external loop
  for (j in 1:i){ 
    # internal loop
    cat(format(j,width = w))
    # print(j)
    # numbers are printed in a width of 4
    # including digits and leading spaces
    # as necessary
  } # for (j in 1:i) - end
  # end of internal loop
  cat("\n") # go to new line
} # for (i in 1:n) - end
