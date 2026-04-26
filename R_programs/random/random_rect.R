rm(list = ls())
# ###############################
# Random rectangle, given       #
#   - bottom left x and y       #
#   - top right x and y         #
#   - number of points          #
# ###############################
rand.rect <-
  function(   npoints = 1000
            , blx = -1
            , bly = -1
            , trx = 1
            , try = 1
           ) {
    r_rectangle <-
      data.frame(x = runif(npoints, min = blx, max = trx),
                 y = runif(npoints, min = bly, max = try))
    return(r_rectangle)
  }

r <- rand.rect()

plot(r)

# generate the random points inside a rectangle
r_rect <- rand.rect(5000,0,0,2,2)
plot(r_rect)
# plot the points - aspect ratio is set to 1
#                   so x and y axis have the 
#                   same number of pixel per
#                   scale unit
plot(r_rect, asp = 1)
# Now we rotate the figure using a 
# a linear transformation (remember Algebra)
sqrt2 <- 1/sqrt(2)
rot <- matrix(c(sqrt2,sqrt2,-sqrt2,sqrt2),ncol=2)
rot
# Rotation using matrix product operator %*%
x <- data.matrix(r_rect) %*% rot
plot(x, asp = 1)

rot2 <- matrix(c(1,1,-1,1),ncol=2)
x <- data.matrix(r_rect) %*% rot2
