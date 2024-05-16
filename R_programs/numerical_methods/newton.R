rm(list = ls())
# https://www.quora.com/When-does-Newton-Raphson-fail
# ############################### #
# find zero with Newton           #
# ############################### #
# parameters:
# f, f.prime:    function for which we serach the root and its derivative
# guess:         initial guess
# tol:           precision tolerance, defaults to 10E-7
#
# use:
# x:     value of x to be checked
#
# algo:
# - use guess as first value to check, storing it in x
# - repeat if the absolute value of the function in x
#      is greater than the tolerance
#   - x <- new value to check with the tangent method
# - the loop stops when the desired precision is reached 
# 
zero_nwt <- function(f, f.prime, guess = 0, tol = 10E-7){
  x <- guess
  # while (abs(f(x)) > tol){
  #   x <- x - f(x) / f.prime(x)
  # }
  repeat {
    x <- x - f(x) / f.prime(x)
    print(x)
    if (abs(f(x)) <= tol)
      break
  }
  return(x)
}

f <- function(x){ # two zeroes in 1 and -1
  return(x^2-1)
}
f.prime <- function(x){
  return(2*x)
}


# test code for zero_nwt
initial <- 0.4
# initial <- -0.4 

zero.f <- zero_nwt(f,f.prime,initial)
cat(paste("x = "
          , zero.f
          , "f(x) = "
          ,f(zero.f))
    )

#######################################

