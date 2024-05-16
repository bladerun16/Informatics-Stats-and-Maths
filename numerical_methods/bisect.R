rm(list = ls())
left <- -3
right <- 3
#initial <- 0

# f <- function(x) {x^3 + 2 * x^2 - 7}
# f.prime <- function(x) {3 * x^2 + 4 * x}
f <- function(x) {x^3 - 2 * x + 2}

#curve(f, from = -10, to = 2)

# ############################### #
# find zero with bisection        #
# ############################### #
# parameters:
# f:    function for which we will find the zero
# left,right:         initial guesses f(left)*f(right) must be < 0
# tol:           precision tolerance, defaults to 10E-7
#
# use:
# x:     midpoint between left and right to be checked
#
# algo:
# - x <- midpoint between left and right
# - repeat if the absolute value of the function in x
#          is greater than the tolerance
#   - if f(left)*f(x) < 0 
#       right <- x , since the zero was between left 
#                    and x
#     else
#       left <- x,  since the zero was between x and right
#   - set x to the midpoint between left and right
# - the loop stops when the desired precision is reached 
# - return x
# 
zero_bisect <- function(f, left, right, tol = 10E-7){
  x <- (left + right) / 2
  while (abs(f(x)) > tol){
    if (f(left) * f(x) < 0)
      right <- x
    else 
      left <- x
    x <- (left + right) / 2
  } # end: while (abs(f(x)) > tol)
  return(x)
}

# ################################
# test code
if (f(left) * f(right) < 0)
  print("Initial values are OK")
result <- zero_bisect(f, left, right)
curve(f, from = left, to = right, 
      main = "Find the zero for x^3 - 2 * x + 2")
text(  result, f(result)
    , labels = paste("Zero in "
                     , round(result,2))
    , cex = 0.7, pos = 3)
points(x = result, y = 0, type = "b")
abline(h = 0)
# 

