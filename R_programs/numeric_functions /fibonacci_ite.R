rm(list = ls())
# Fibonacci numbers https://en.wikipedia.org/wiki/Fibonacci_sequence
# - iterative version
# Parameter: n, non negative integer 
# Uses:
# - n_1, n_2: two previous Fibonacci's numbers
# Algo:
# - if n is non number or non positive returns NA
# - if n is 0 return 0 (base_case_0)
# - if n is 1 return 1 (base_case_1)
# - initialize n_1 to 1 and n_2 to 0
# - repeat varying i from base_case_1+1 to n
#   - compute f as n_1 + n-2
#   - set n_2 to n_1
#   - set n_1 to f
# - return f
fibonacci_ite <- function(n){
  if (!is.numeric(n) || n<0) 
    return(NA) # invalid
  n = as.integer(n) # non integers are truncated
  if (n==0)   # base_case_0 
    return(0) # output 0
  if (n==1)   # base_case_1
    return(1) # output 1
  n_1 <- 1 # preceding value initialized to base_case_1 output
  n_2 <- 0 # value before the preceding initialized to base_case_0 output
  for (i in 2:n){ # from base_case_1 + 1 to n
    f <- n_1 + n_2 # compute i-th Fibonacci's number
    n_2 <- n_1 # shift memory to keep track of the previous two
    n_1 <- f   # shift memory to keep track of the previous two
  } # for (i in 2:n)
  return(f)
} # fibonacciIte
fibonacci <- fibonacci_ite
##### test program ####
for (i in 0:40){
  cat("Fibonacci(",format(i,width = 2),") = ",format(fibonacci(i),width=6),"\n")
}


##### suggested exercise #####
##### - try a recursive implementation of the Fibonacci's computation
##### - compare the running times of the two versions