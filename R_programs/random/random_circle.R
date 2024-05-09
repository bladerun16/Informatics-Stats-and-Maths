rm(list = ls())
# ###############################
# Random circle, given          #
#   - center x and y            #
#   - radius r                  #
# ###############################
rand.circle <-function(npoints = 1000, 
                       cx = 0,cy = 0, r = 1){
  npoints_adj <- npoints * 4 / pi * 1.1 # 1.1 multiplication 
                                        # factor for safety
  x_tot <- vector(mode="numeric", length=npoints_adj)
  y_tot <- vector(mode="numeric", length=npoints_adj)
  x_r <- runif(npoints_adj, min=cx-r, max=cx+r)
  y_r <- runif(npoints_adj, min=cy-r, max=cy+r)
  d <- sqrt((x_r - cx)^2 + (y_r - cy)^2)
#  d <= r # this is a vector of booleans
  x_tot <- x_r[d <= r] # filter will in general give more than 
                       # npoints, due to the multiplication factor
  y_tot <- y_r[d <= r]
#  print(length(x_tot))
  if (length(x_tot) < npoints)
    return(NULL)
  r_circle <- data.frame("x"=x_tot[1:npoints], # 1:npoints filters
                                   # the result to enforce the
                                   # required number of points
                         "y"=y_tot[1:npoints])
  return(r_circle)
}

rc <- rand.circle(2000, 0,0,1) 
print(nrow(rc))
plot(rc,asp = 1)

