# experiment to measure and plot the sorting time with selectionSort
# for varying sizes of the vector to sort
# For a better representation of the behavior with big sizes we will
# vary the sizes on an exponential scale
# 
# Variables
# scales - exponents
# sizes - 10 ^scales
# x - vector to sort
# y - sorted vector
# 
# Algorithm
# repeat varying scale on all the scales
#   generate a sampled vector x of size 10^scale
#   get system time for the selectionSort of x and store it in sortTime
# plot sizes and sort time
rm(list = ls())
source("/cloud/project/R_programs/sorting/selectionSort.R")
source("/cloud/project/R_programs/sorting/mergeSort/mergeSort.R")
source("/cloud/project/R_programs/sorting/bubbleSort.r")
# sortFun <- selectionSort
# sortFun <- bubbleSort
sortFun <- mergeSort
numScales <- 6
scales <- 1:numScales
sizes <- 10^scales
sortTimes <- numeric(length(sizes)) # initialise the vector of results
for (i in 1:numScales){
  x <- sample(1:sizes[i])
  sortTimes[i] <-  system.time({
    y <- sortFun(x)  # sortFun is the function name instantiated with 
                     # the function that I want to test
  })["elapsed"]
}
sortTimesMS <- sortTimes
plot(sizes,sortTimes, log="x")

