# ############################### #
# find zero with bisection        #
#   tracking version              #
# ############################### #
# parameters:
# f:    function to be minimized and its derivative
# left,right:         initial guesses
# tol:           precision tolerance, defaults to 10E-7
#
# use:
# x: vector of the midpoints between left and right that are checked
# t: index for the positions of x
#
# algo:
# - midpoint between left,right as first value to check, storing it in x
# - initialize t to 1
# - repeat if the absolute value of the function in x
#                is greater than the tolerance
#   - if f(x)*f(left) < 0 
#       right <- x
#   else
#       left <- x
#   - set x to the midpoint between left and right
# - the loop stops when the desired precision is reached 
# 
zero_bisect_tracking <- function(f, left, right, tol = 10E-7){
  t <- 1
  x <- vector(mode = "numeric")
  x[t] <- (left + right) / 2
  while (abs(f(x[t])) > tol){
    if (f(left) * f(x[t]) < 0)
      right <- x[t]
    else 
      left <- x[t]
    x[t + 1] <- (left + right) / 2
    t <- t + 1
  } # end: while (abs(f(x[t])) > tol)
  return(list(zero = x[t], tracking = x))
}


