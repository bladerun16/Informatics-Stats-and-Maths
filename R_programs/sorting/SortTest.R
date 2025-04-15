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


n <- 6 # order of magnitude
# Generate the sequence
sizes <- as.integer(10^(rep(3:n, each = 2) + rep(c(0, log10(5.0000001)), n-2)))
sizes

benchmark_function <- function(sizes, f, times = 1) {
  results <- numeric(length(sizes))
  for (i in seq_along(sizes)) {
    s <- sizes[i]
    # Run the function `times` times and take the average time
    input <- runif(s)  # generate random numeric vector of length s
    total_time <- 0
    for (j in 1:times) {
      time <- system.time(f(input))["elapsed"]
      total_time <- total_time + time
    }
    results[i] <- total_time / times
  }
  
  names(results) <- sizes
  return(results)
}

msTimes <- benchmark_function(sizes, mergeSort)

plot(sizes,msTimes
     , type="b"
     , log="x"
     , xlab = 
)

lines(sizes, sortTimes, type="b")

sortTimes <- benchmark_function(sizes, sort)
