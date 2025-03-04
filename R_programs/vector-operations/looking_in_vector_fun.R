rm(list=ls())
# #####################
# search_in_vector    #
# #####################
# Parameters v:      vector of values,
#     target: value to be found
# Output
#     found:  vector of integers, empty if not found, 
#             with values between 1 and length of v 
#             if found
# Uses
#     n_found: number of occurrencies of target in v
#     i: index on v
#     
# Algo
# set n_found to 0
# create empty vector "found"
# repeat varying i from 1 to length of v
#    if the position i of v is equal to target
#       increment n_found by 1
#       set the n_found position of found to i
# return the vector "found"
# 
search_in_vector <- function(v, target) {
# initialization
  n_found <- 0 # at the moment, none is found
  found <- vector(mode = "integer") # prepares an empty vector
  # search loop
  for (i in seq_along(v)) {
    if (v[i] == target) {
      # when the current position is equal to target
      #   store current i in found at new position n_found
      n_found <- n_found + 1
      found[n_found] <- i
    } # if (v[i] == target)
  } # for (i in seq_along(v))
  return(found)
} # search_in_vector: end

# #####################
# test program        #
# #####################
#colors <- c("Red", "Blue", "Green", "Orange", "Green")
numbers <- c(33,12.4,57,99,12.4)
# input
# target <- readline("Insert target color ")
target <- as.double(readline("Insert target number "))
cat(target)
# f <- search_in_vector(colors, target)
f <- search_in_vector(numbers, target)
if (length(f) == 0){
  cat(" not found")
} else {
  cat(" found in position\n")
  print(f)
}

# ####################### #
# example of timing the execution
# - decide the range of sizes you want to test 
#   and the step of sizes
# - prepare a data structure to collect the results
# - for each size of interest n
#   - prepare a random, artificial, set of data of size n
#     (as an alternative, you can use real data)
#   - execute the program inside system.time and collect the resulting elapsed time
# - show the results

ntest <- 4
nrep <- 1000
start <- 1
result <- data.frame(n = vector(mode = "integer", length = ntest), 
                     time = vector(mode = "double", length = ntest)
)
for (i in 1:ntest){
  n <- 10^(i+start)
  v <- sample(rng, n, replace = TRUE)
  target <- sample(rng, 1)
  result$n[i] <- n
  result$time[i] <- system.time(
    for (r in 1:nrep)
      search_in_vector(v, target)
    )[3]
}
print(result)
plot(result, log = "x")
