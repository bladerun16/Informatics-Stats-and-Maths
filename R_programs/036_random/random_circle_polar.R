rm(list=ls())
# generate n values between 0 and 2*PI for the angle
# generate n values between 0 and r for the distance from the center
# transform the pairs theta,r into x and y with sin and cos
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
