rm(list = ls())
# #################################### #
# find zero with Newton                #
#     tracking version:                #
#     all the points of the sequence   #
#     are stored, for didactic purpose #
# #################################### #
# parameters:
# f, f.prime:    function to be minimized and its derivative
# guess:         initial guess
# tol:           precision tolerance, defaults to 10E-7
# max_loop:      maximum number of iterations
#
# use:
# x:     vector of the values checked
#
# algo:
# - use guess as first value to check, storing it in x
# - repeat max_loop times
#   - if the function in x is less than the tolerance
#     - return x as the result
#   - compute new value  to check with the tangent method
#     and store it in the current position of x
# - if comes here, the precision has not been reached and returns null 
# 
zero_nwt_tracking <- function(f, f.prime
                              , guess = 0
                              , tol = 10E-7
                              , max_loop = 10E3
){
  t <- 1
  x <- vector(mode = "numeric")
  x[t] <- guess
  for (i in 1:max_loop){
    if (abs(f(x[t])) <= tol){
      return(list(zero = x[t], track = x))
    }
    x[t+1] <- x[t] - f(x[t]) / f.prime(x[t])
    t <- t + 1
  }
  return(NULL)
}

# ################################
# test code

# converges with any value
# f <- function(x) {x^3 - 2 * x + 2}
# f.prime <- function(x) {3 * x^2 - 2}
# initial <- 1
#
# example of non convergence when guess >abs(1/sqrt(2))
f <- function(x) {x * exp(-x^2)}
f.prime <- function(x) {-(2 * x^2 -1) * exp(-x^2)}
# initial <- 0.499 # try 0.5 for non convergence
initial <- 0.5 # try 0.5 for non convergence


#curve(f, from = -10, to = 2)
curve(f, from = -2, to = 2)

wait <- 1
result <- zero_nwt_tracking(f, f.prime, initial)
if (!is.null(result)) {
  hc <- heat.colors(length(result$track) * 2)
  for (i in seq_along(result$track)) {
    points(result$track[i], f(result$track[i]), col = hc[i])
    Sys.sleep(wait)
    wait <- wait * 0.9
  }
  text(  result$zero, f(result$zero)
         , labels = paste("Zero in "
                          ,round(result$zero,2)
                          ," Steps: ",length(result$track))
         
         , cex = 0.7
         , pos = 3)
} else {
  print("Precision not reached")
}

