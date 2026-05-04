rm(list=ls())
# set.seed(43) # comment for non repeatable experiment
# ########################################### #
# Search positions for occurrencies of target #
# in a vector                                 #
# Loops (for and while) vs vectorised         #
# ########################################### #
# Includes ggplot example                     #
# ########################################### #
# #################### #
# search_in_vector_for #
# #################### #
# Parameters v:      vector of values,
#       target: value to be found
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
search_in_vector_for <- function(v, target) {
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
} # search_in_vector_for: end

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

# ### test program ### #
# with data collection and plot
m <- 100 # the domain of the values in the search vector is 1:100

range <- 3:7      # range of exponents
sizes <- 10^range # exponential sequence of sizes
# structure for the collection of running times
times <- data.frame(size       = sizes,
                    forloop    = numeric(length=length(range)),
                    whileloop  = numeric(length=length(range)),
                    vectorized = numeric(length=length(range))
) # times data frame

# loop on experiment sizes
for (i in seq_along(sizes)){
  target <- sample.int(m, size = 1) # prepare target
  v <- sample.int(m, size = sizes[i], replace = T) # prepare the vector to search
  cat("Testing size ", sizes[i], "\n")
  cat(".")
  times$vectorized[i] <- system.time(f <- search_in_vector_vec(v, target))[3]
  cat(".")
  times$forloop[i] <- system.time(f <- search_in_vector_for(v, target))[3]
  cat(".")
  times$whileloop[i] <- system.time(f <- search_in_vector_while(v, target))[3]
  cat("\n")
} # loop on experiment sizes

# times[ , -1][times[ , -1] == 0] <- NA

# install.packages("tidyverse")
library(tidyverse)

times_long <- pivot_longer(
  times,
  cols = -size,
  names_to = "method",
  values_to = "time"
)
# ### Explanation ### #
# ggplot wants the data in "tidy format"
# the last three columns are y values obtained
# with three different methods for the same x (size)
# 
# size | forloop | whileloop | vectorized
# -----+---------+-----------+------------
#   100 |   0.10  |   0.12    |   0.01
#  1000 |   1.20  |   1.10    |   0.05
#  
#  this representation is transformed into the tidy format
#  with 
#  pivot_longer(
#    cols = -size, # the column that is maintained
#    names_to = "method", # the column labeling the three
#                           dependent variables
#    values_to = "time"   # the name of the new dependent variable
#  )
#  size | method     | time
# -----+------------+------
#   100 | forloop    | 0.10
#   100 | whileloop  | 0.12
#   100 | vectorized | 0.01
#  1000 | forloop    | 1.20
#  1000 | whileloop  | 1.10
#  1000 | vectorized | 0.05

# ### structural view ### #
# WIDE TABLE                          LONG TABLE
# -----------                         ------------------------
# (size, f, w, v)      ───────▶       (size, method, value)
# 
# columns → rows                      column names → values
# values stay values                  values stay values
# 
# Or more formally:
# Original:    (id, c1, c2, ..., ck)
# Transformed: (id, key, value)
# where:
#   key ∈ {c1, ..., ck}
# value = corresponding cell
# 
# Key intuition
# pivot_longer(): moves information from the schema (column names)
#                 → into data (rows in a “key” column)
# 
# This is why it’s essential for ggplot2:
#   ggplot expects variables to be columns, not encoded in column names.

# now we can pass times_long to ggplot
ggplot(times_long, aes(x = size, y = time, color = method)) +
  geom_line() +    # plot with lines
  geom_point() +   # plot the actual points on the lines
  scale_x_log10() + # logarithmic scale on x
  scale_y_log10() + # logarithmic scale on y
  labs(#title = "Loops vs vectorized execution times",
    x = "Input size", y = "Time", color = "Method")  # set labels

