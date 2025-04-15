rm(list = ls())
source("selectionSort.r")
source("mergeSort/mergeSort.r")
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
results_selection <- data.frame(matrix(ncol=2,nrow = 0))
colnames(results_selection) = c("size", "elapsed_selection")
for (l in 10^seq(1,4,0.5)){
  v <- sample(1:l)
  results_selection[nrow(results_selection)+1,] <- c(l, system.time(replicate(r,{selectionSort(v)}))[3])
}
results_selection

plot(results_selection$size,results_selection$elapsed_selection
     , type="l"
#     , log="xy"
     )

results_merge <- data.frame(matrix(ncol=2,nrow = 0))
colnames(results_merge) = c("size", "elapsed_merge")
for (l in 10^seq(1,4,0.5)){
  v <- sample(1:l)
  results_merge[nrow(results_merge)+1,] <- c(l, system.time(replicate(r,{mergeSort(v)}))[3])
}

lines(results_merge$size,results_merge$elapsed_merge)
