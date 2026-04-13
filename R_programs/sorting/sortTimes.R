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
numScales <- 4
scales <- 1:numScales
sizes <- 10^scales
sortTimes <- numeric(length(sizes)) # initialise the vector of results
for (i in 1:numScales){
  x <- sample(1:sizes[i])
  sortTimes[i] <-  system.time({
    y <- selectionSort(x)
  })["elapsed"]
}

plot(sizes,sortTimes, log="x")
