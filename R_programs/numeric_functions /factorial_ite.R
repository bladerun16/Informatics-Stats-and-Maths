rm(list = ls())
# factorial of a non-negative integer
# Observation: if n is 0 the program must give the output 1
# use n: integer for which we will compute the factorial
#     i: will get all the values from 1 to n
#     f: the resulting factorial, iteratively computed
#
# input n
# f <- 1
# repeat varying i from 1 to n
#    f <- f * i
# output f
my_fact <- function(n){ # interface
  f <- 1
  # the sequence seq_len is empty when its argument is 0
  for (i in seq_len(n)){
    f <- f * i
  }
  return(f) # return the result to the calling program
} # my_fact - end

# ###############################
# Test
repeat{
  n <- as.integer(readline("Insert a non-negative integer "))
  cat("The factorial of ",n," is ",my_fact(n),"\n\n")
  print(" to exit")
} # repeat - end