rm(list = ls())
# ######################################################### #
# rand.ellipsis                                             #
#                                                           #
# generate points inside a standard ellipsis                #
# centered in the origin and axes aligned with              #
# the coordinates; from the conditions it follows that the  #
# two focuses are on the x axis and can be described as     #
# -f, f
#                                         #
# Parameters:                                               #
# - npoints                                                 #
# - x:  x coordinate of right focus                         #
# - d:  sum of the distances of the limit points from the   #
#       two focuses                                         #
# The default values produce a unitary circle               #
# ######################################################### #
rand.ellipsis <-function(npoints = 1000, 
                         f2x =  0, # x coordinate of one focus
                         d = 2){ # the default gives a unitary circle
  # ellipsis centered in the origin with the major axis horizontal
  safety_factor <- 1.1 # increment of points to compensate
                       # random effects and avoid the possibility
                       # of having less than npoints left
  npoints_adj <- npoints * 4 / pi * safety_factor 
                       # increment of points due to the theoretical
                       # 4/pi ratio of rectangle/ellipsis area 
  # setting missing coordinates of focuses
  f1x <- -f2x
  f1y <- 0 
  f2y <- 0
  if (sqrt((f2x-f1x)^2 + (f2y-f1y)^2) > d) # implement the condition of validity
    return(NULL)
  fd <- f2x - f1x # distance between the focuses
  sax <- d/2      # horizontal semiax
  say <- sqrt((d/2)^2 - (fd/2)^2) # vertical semiax
  # factor for safety 
  maxx <- sax
  minx <- -maxx
  maxy <- say
  miny <- -say
    # x_tot <- vector(mode="numeric", length=npoints_adj)
  # y_tot <- vector(mode="numeric", length=npoints_adj)
  x <- runif(npoints_adj, min=minx, max=maxx)
  y <- runif(npoints_adj, min=miny, max=maxy)
  # implement the condition
  d1 <- sqrt((x-f1x)^2 + (y-f1y)^2)
  d2 <- sqrt((x-f2x)^2 + (y-f2y)^2)
  dp <- d1 + d2
  #  dp <= r # this is a vector of booleans
  x_out <- x[dp <= d] # filter will in general give more than 
  # npoints, due to the multiplication factor
  y_out <- y[dp <= d]  
  if (length(x_out) < npoints)
    return(NULL)
  ellipsis <- data.frame("x"=x_out[1:npoints], # 1:npoints filters
                         # the result to enforce the
                         # required number of points
                         "y"=y_out[1:npoints])
  return(ellipsis)
}
# e <- rand.ellipsis(1000,0,1)
# e <- rand.ellipsis(100,2,4.1)
# 
repeat {
  e <- rand.ellipsis(500,2,4.1)
  if (!is.null(e))
    break
}
sqrt2 <- 1/sqrt(2)
rot45 <- matrix(c(sqrt2,sqrt2,-sqrt2,sqrt2), ncol = 2)
# Rotate and translate
e <- data.matrix(e)%*%rot45 + c(1,1)
plot(e, asp = 1)
