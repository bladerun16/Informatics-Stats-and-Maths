rm(list=ls())
# #####################
# search_in_vector    #
# #####################
# Parameters v:      vector of values,
#     target: value to be found
# Output
#     found:  positions where target is found
#             vector of integers, empty if not found, 
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

search_in_vector_while <- function(v, target) {
  # initialization
  n_found <- 0 # at the moment, none is found
  found <- vector(mode = "integer") # prepares an empty vector
  i <- 1
  # search loop
  while (i <= length(v)) {
    if (v[i] == target) {
      # when the current position is equal to target
      #   store current i in found at new position n_found
      n_found <- n_found + 1
      found[n_found] <- i
    } # if (v[i] == target)
    i <- i+1
  } # while
  return(found)
} # search_in_vector_while: end

# #####################
# search_in_vector_vec    #
# #####################
# Parameters v:      vector of values,
#     target: value to be found
# Output
#     found:  positions where target is found
#             vector of integers, empty if not found, 
#             with values between 1 and length of v 
#             if found
# Uses
#     found: vector of positions where target is found in v
#     i: index on v
#     
# Algo
# create empty vector "found"
# repeat varying i from 1 to length of v
#    if the position i of v is equal to target
#       increment n_found by 1
#       set the n_found position of found to i
# return the vector "found"
# 
search_in_vector_vec <- function(v, target) {
  # initialization
  found <- which(v == target)
  # search loop
  return(found)
} # search_in_vector_vec: end



# #####################
# test program        #
# #####################
#colors <- c("Red", "Blue", "Green", "Orange", "Green")
m <- 10
n <- 3000000
v <- sample.int(m, size = n, replace = T)
target <- sample.int(m, size = 1)

# f <- search_in_vector(v, target)
# if (length(f) == 0){
#   cat(" not found")
# } else {
#   cat(" found in position\n")
#   print(f)
# }

cat("Search time with for loop   ",
    system.time(f <- search_in_vector(v, target))[1],# [1] selects user time
    "\n"
    
)

cat("Search time with while loop ",
    system.time(f <- search_in_vector_while(v, target))[1],# [1] selects user time
    "\n"
    
)

# f <- search_in_vector_vec(v, target)
# if (length(f) == 0){
#   cat(" not found")
# } else {
#   cat(" found in position\n")
#   print(f)
# }

cat("Search time vectorised      ",
    system.time(f <- search_in_vector_vec(v, target))[1],
    "\n"
    
)

