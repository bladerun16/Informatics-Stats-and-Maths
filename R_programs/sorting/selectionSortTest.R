rm(list = ls())
source("selectionSort.r")
######################################

# prepare an empty dataframe results with two columns n and t
# repeat varying n from 100 to 10000 step 100
#   generate a random vector v with n elements
#   read the current time and store it in a variable
#   execute the sorting experiment on v
#   read the difference between the current time and the previous
#   add the results at the bottom of the dataframe
# plot the dataframe results 

r <- 5
results <- data.frame(matrix(ncol=2,nrow = 0))
colnames(results) = c("size", "elapsed_time")
for (l in 10^seq(1,4,0.5)){
  v <- sample(1:l)
  results[nrow(results)+1,] <- c(l, system.time(replicate(r,{selectionSort(v)}))[3])
}
results

plot(results$size,results$elapsed_time)

plot(results$size,results$elapsed_time, type = "l")
