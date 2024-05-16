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
    if (abs(f(x)) <= tol)
      break
  }
  return(x)
}

# f <- function(x){
#   return(cos(x))
# }
# f.prime <- function(x){
#   return(-sin(x))
# }

f <- function(x){
  return(x^2+1)
}
f.prime <- function(x){
  return(2*x)
}


# test code for zero_nwt
# initial <- pi/2 + 0.1
initial <- 0.1
# initial <- -0.4
# initial <- 0.4 
# initial <- 0.499
# initial <- 0.5
zero.f <- zero_nwt(f,f.prime,initial)
cat(paste("x = "
          , zero.f
          , "f(x) = "
          ,f(zero.f))
    )

#######################################

# ############################### #
# find zero with Newton           #
#     safe version:               #
#        limited number of        #
#        iterations               #
# ############################### #
# parameters:
# f, f.prime:    function to be minimized and its derivative
# guess:         initial guess
# tol:           precision tolerance, defaults to 10E-7
# max_loop:      maximum number of iterations
#
# use:
# x:     new value of x to be checked
#
# algo:
# - use guess as first value to check, storing it in x
# - repeat max_loop times
#   - if the function in x is less than the tolerance
#     - return x as the result
#   - compute new value x to check with the tangent method
# - if comes here, the precision has not been reached and returns null 
# 
zero_nwt_safe <- function(f, f.prime
                          , guess = 0
                          , tol = 10E-7
                          , max_loop = 10E3
                          ){
  x <- guess
  for (i in 1:max_loop){
    if (abs(f(x)) <= tol)
      return(x) # convergence reached: return the result
    # if it comes here will do another loop, unless max is reached
    x <- x - f(x) / f.prime(x)
  } # for (i in 1:max_loop)
  # if it comes here the convergence has not been reached
  return(NULL)
} # zero_nwt_safe

###################
# test program for zero_nwt_safe
initial <- 0.5
# initial <- 0.4
zero.f <- zero_nwt_safe(f,f.prime,initial) # 4 are not enough
if(is.null(zero.f)) {
  cat("Precision not reached") 
} else {
  cat(paste("x = "
            , zero.f
            , "f(x) = "
            ,f(zero.f)))
}
