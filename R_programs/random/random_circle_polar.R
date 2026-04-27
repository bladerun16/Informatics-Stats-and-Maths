rm(list=ls())
# generate n values between 0 and 2*PI for the angle
# generate n values between 0 and r for the distance from the center
# transform the pairs theta,r into x and y with sin and cos
# *************
# Observation:
# With a uniform distribution on R the points are 
# more concentrated towards the origin, because:
# - the the area of a ring (corona circolare) with 
#   radius (r,r+dr) increases linearly with r (derivative of r^2)
# - the number of points falling randomly on the annulus
#   points on the ring is constant in r
# - therefore the points density (points/area) changes as 1/r 
# - to obtain a constant density the distribution of points 
#   must also increase with r^2
# - thanks to the "Inverse transformation method" 
#   (https://en.wikipedia.org/wiki/Inverse_transform_sampling) 
#   the transformation of the generated radius values with square root
#   (inverse of the square, for non negative values) does the trick
#   **********
rand_circ_polar <- function(n = 100,
                            c_x = 0,
                            c_y = 0,
                            R = 1){
  theta <- runif(n, min=0, max=2*pi)
  r     <- runif(n, min=0, max=1)
  r     <- sqrt(r)*R
  x     <- r * cos(theta)
  y     <- r * sin(theta)
  circle <- data.frame("x"=x,"y"=y)
  return(circle)
}
c <- rand_circ_polar(5000)
plot(c)
