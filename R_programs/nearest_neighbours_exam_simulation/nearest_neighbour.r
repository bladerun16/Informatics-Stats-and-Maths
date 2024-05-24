# Find nearest neighbour
rm(list = ls())
# distance between two points represented as two vectors
# of coordinates
dist_p <- function(p1,p2){
  sqrt(sum((p1-p2)^2))
} # dist_p

# ############################
# nearest_neighbour
# Given a dataframe whose columns represent the coordinates of points
# in a d-dimensional space, for each point find the index and the distance 
# of the nearest neighbour
# Method:
# for each point scan the entire dataset to find the other point
# with minimal distance
# Parameters:
# - df: a dataframe where each row represent a point in a d-dimensional space
# Uses:
# - i:  index for the main loop on points
# - j:  index for the secondary loop on the neighbours of a point i
# - dist_nn_i:  distance of the nearest neighbour of i
# - nn_i:       nearest neighbour of i
# - dist_ij:  distance of the current pair i,j
# Algorithm:
# - prepare an empty dataframe with two columns: the index of the
#   nearest neighbour and its distance from the corresponding point
# - repeat for each row i of the dataframe
#   - initialize the minimum distance dist_nn from i to 
#     the maximum double
#   - for each row j in the dataframe different from i
#     - compute the distance dist_ij between the point in i and the point in j
#     - if dist_ij is smaller than the current minimum dist_nn_i
#       - set dist_nn_i to dist_ij
#       - set nn_i to j
#   - store the pair nn_i,dist_nn_i to the i row of the output
# - return the output dataframe
nearest_neighbour <- function(df){
  nn_df <- data.frame(nn = vector(mode="integer"), 
                      nn_dist = vector(mode="double"))
  for (i in 1:nrow(df)){
    dist_nn_i <- .Machine$double.xmax
    for (j in (1:nrow(df))[-i]){
      dist_ij <- dist_p(df[i,],df[j,])
      if (dist_ij < dist_nn_i){
        dist_nn_i <- dist_ij
        nn_i <- j
      } # if (dist_curr < dist_min)
    } # for (j in (1:nrow(df))[-i])
    nn_df[i,] <- c(nn_i,dist_nn_i)
  } # for (i in 1:nrow(df))
  return(nn_df)
} # nearest_neighbour - end

# ###################
# test program
df <- read.csv("2d_points.csv")
print(df)
nn_df <- nearest_neighbour(df)
print(cbind(df,nn_df))
##### optional #####
plot(df$x,df$y,asp=1) # asp=1 forces the xy ratio to 1
text(df$x,df$y+0.1,1:nrow(df))
dest <- df[nn_df$nn,]
arrows(df$x,df$y,dest$x,dest$y)
write.csv(cbind(df,nn_df),"2d_points_w_nn.csv")

