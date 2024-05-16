rm(list = ls())
# function to be minimized
f <- function(x){
  abs(x - 3.5) + (x - 2)^2
}
# end: function to be minimized

# test adding points to the plot
# x <- c(2,4)
# fx <- c(f(x[1]),f(x[2]))
# points(x,fx)
# text(x,fx, labels = c("x1","x2"), cex = 0.7, pos = 3)
# text(3,2, labels = "ciao", cex = 0.7, pos = 3)
# end test

# ############################### #
# find minimum with golden search #
# ############################### #
# parameters:
# f:    function to be minimized
# a,b:  endpoints of the interval over which we look for the minimum
#       their values will be locally changed as the interval narrows
# tol:  tolerance in the precision of the minimum, defaults to 10E-7
# 
# use:
# x1, x2:  x values where the function is tested
# ratio:   the golden ratio
#
# algo:
# - choose x1 < x2 interior to a,b, according to the golden ratio
# - f1, f2 <- the values of f in x1 and x2, respectively
# - repeat if the interval size is greater than the tolerance
#   - if f2 > f1 the minimum lies between a and x2
#     - b  <- x2
#     - x2 <- x1
#     - f2 <- f1 (without need of computation)
#     - x1 <- new value according to the golden ratio 
#             left side w.r.t. a and b
#     - f1 <- f(x1)
#   else
#     - a  <- x1
#     - x1 <- x2
#     - f1 <- f2 (without need of computation)
#     - x2 <- new value according to the golden ratio 
#             right side w.r.t. a and b
#     - f2 <- f(x2)
# - when the repetition stops the interval [a,b] is shorter
#   than the tolerance, therefore the midpoint can
#   be taken as the minimizer of f inside the starting interval

golden_min <- function(f, a, b, tol = 10E-7){
  ratio <- 2 / (sqrt(5) + 1)
  # left side
  x1 <- b - ratio * (b - a)
  f1 <- f(x1)
  # right side
  x2 <- a + ratio * (b - a)
  f2 <- f(x2)
  while (abs(b - a) > tol){
    if (f2 > f1){ # continue between a and x2
      b <- x2
      x2 <- x1
      f2 <- f1
      x1 <- b - ratio * (b - a)
      f1 <- f(x1)
    } else { # continue between x1 and b
      a <- x1
      x1 <- x2
      f1 <- f2
      x2 <- a + ratio * (b - a)
      f2 <- f(x2)
    } # end: if (f2 > f1)
  } # end: while (abs(b - a) > tol)
  return((a + b) / 2)
}

# ############################################## #
# same as golden_min, but returns also a vector  #
# with all the tested values of x                #
# ############################################## #
golden_min_tracking <- function(f, a, b, tol = 10E-7){
  ratio <- 2 / (sqrt(5) + 1)
  x1 <- b - ratio * (b - a)
  x2 <- a + ratio * (b - a)
  tr <- c(x1,x2)
  f1 <- f(x1)
  f2 <- f(x2)
  while (abs(b - a) > tol){
    if (f2 > f1){
      b <- x2
      x2 <- x1
      f2 <- f1
      x1 <- b - ratio * (b - a)
      tr <- c(tr, x1)
      f1 <- f(x1)
    } else {
      a <- x1
      x1 <- x2
      f1 <- f2
      x2 <- a + ratio * (b - a)
      tr <- c(tr, x2)
      f2 <- f(x2)
    }
  }
  return(list(x_min = (a + b) / 2
            , track = tr
            )
         )
}


########################################
# test code
########################################
left  <- 1
right <- 5

# Plots function in a given interval
curve(f, from = left, to = right)

# find minimum and obtain track of tested values
result <- golden_min_tracking(f, left, right)
wait <- 1

# put the track points on the plot
for (i in seq_along(result$track)){
  points(result$track[i], f(result$track[i]))
  # plotting waits for presentation reasons
  Sys.sleep(wait)
  wait <- wait * 0.9 # wait time is reduced as the result is approaching
}

# put the result label on the plot
points(result$x_min, f(result$x_min))
text(  result$x_min, f(result$x_min)
     , labels = paste("Min in ",round(result$x_min,2)), cex = 0.7, pos = 3)

