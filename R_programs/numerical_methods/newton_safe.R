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

# first attempt, a function with zeroes
f <- function(x){ # two zeroes in 1 and -1
  return(x^2-1)
}
f.prime <- function(x){
  return(2*x)
}
initial <- 0.5
# initial <- - 0.4
zero.f <- zero_nwt_safe(f,f.prime,initial) # 4 are not enough
if(is.null(zero.f)) {
  cat("Precision not reached") 
} else {
  cat(paste("x = "
            , zero.f
            , "f(x) = "
            ,f(zero.f)))
}


# second attempt, a function with no zeroes
f <- function(x){ # two zeroes in 1 and -1
  return(x^2+1)
}
f.prime <- function(x){
  return(2*x)
}
initial <- 0.5
# initial <- - 0.4
zero.f <- zero_nwt_safe(f,f.prime,initial) # 4 are not enough
if(is.null(zero.f)) {
  cat("Precision not reached") 
} else {
  cat(paste("x = "
            , zero.f
            , "f(x) = "
            ,f(zero.f)))
}
