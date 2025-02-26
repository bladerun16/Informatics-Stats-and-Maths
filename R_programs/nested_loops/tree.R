rm(list=ls())
# Use n: number of rows
#     i: counter for rows
#     j: counter for columns
#     w: width of each number area
# Input n
# Repeat varying i 1 to n
#   write (n-i) times the w space
#   Repeat varying j 1 to i
#     Output j
#   Repeat varying j i-1 to 1
#     Output j
#   Go to new line
w <- 4
n <- as.integer(readline("Insert integer "))
# n <- 10
for (i in 1:n){
  for (j in seq_len(n-i)) # internal loop for spaces
    cat(format("",width = w))
  for (j in 1:i)
    cat(format(j, width = w))
  for (j in seq(from=i-1,to=1,length.out = i-1))
      # lenght.out cuts the sequence to i-1 elements
      # this allows to have a zero right part in first row
    cat(format(j, width = w))
  cat("\n")
} # for (i in 1:n) - end