rm(list = ls())
# ################### #
# factorial           #
# ################### #
# factorial of a non-negative integer
# Observation: if n is 0 the program must give the output 1
# parameter n: integer for which we will compute the factorial
# use:
#     i: will get all the values from 1 to n
#     f: the resulting factorial, iteratively computed
# algorithm:
# if n is return NA
# f <- 1
# repeat varying i from 1 to n
#    f <- f * i
# output f
# ####
my_fact <- function(n) {
  # interface
  if (n < 0){
    return(NA)
    }  
  f <- 1
  # the sequence seq_len is empty when its argument is 0
  for (i in seq_len(n)) {
    f <- f * i
  }
  return(f) # return the result to the calling program
} # my_fact - end

# n <- as.integer(readline("Insert a non-negative integer "))
n <- -1
n <- 4
nf <- my_fact(n)
if (is.na(nf)) {
  print("Bad input value")
} else
  cat("The factorial of ", n, " is ", nf, "\n")

# Question: what happens with non integer values?
#  n <- 3.5
#  n <- 3.999999999999999
#  n <- 3.9999999999999999