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
# - if n is non number or non positive returns NULL
# f <- 1
# repeat varying i from 1 to n
#    f <- f * i
# output f
# ####
factorial_ite <- function(n) {
  # interface
  if (!is.numeric(n) || n < 0)
    return(NA)
  n = as.integer(n) # non integers are truncated
  f <- 1
  # the sequence seq_len is empty when its argument is 0
  for (i in seq_len(n)) {
    f <- f * i
  }
  return(f) # return the result to the calling program
} # my_fact - end

# n <- as.integer(readline("Insert a non-negative integer "))
n <- -1
n <- 4.4
nf <- factorial_ite(n)
if (is.na(nf)) {
  print("Bad input value")
} else
  cat("The factorial of ", n, " is ", nf, "\n")

##### test program ####
for (i in 0:10){
  cat("Factorial(",format(i,width = 2),") = ",
      format(factorial_ite(i),width = 10),"\n")
}


##### suggested exercise #####
##### - try a recursive implementation of the Factorial computation
##### - compare the running times of the two versions