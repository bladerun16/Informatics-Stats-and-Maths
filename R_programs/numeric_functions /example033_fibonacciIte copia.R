# Fibonacci - iterative version
# Parameter: n, non negative integer 
# Uses:
# - n_1, n_2: two previous Fibonacci's numbers
# Algo:
# - if n is non positive returns NULL
# - if n is 1 or 2 returns 1
# - initialize n_1 and n_2 to 1
# - repeat n-2 times
#   - compute f as n_1 + n-2
#   - set n_2 to n_1
#   - set n_1 to f
# - return f
fibonacciIte <- function(n){
  if (n<=0) return(NULL)
  if (n==1 | n==2)
    return(1)
  n_1 <- 1
  n_2 <- 1
  for (i in 3:n){
    # compute i-th Fibonacci's number
    f <- n_1 + n_2
    # shift memory to keep track of the previous two
    n_2 <- n_1
    n_1 <- f
  } # for (i in 3:n)
  return(f)
} # fibonacciIte

n <- as.integer((readline("Insert integer ")))
print(fibonacciIte(n))
