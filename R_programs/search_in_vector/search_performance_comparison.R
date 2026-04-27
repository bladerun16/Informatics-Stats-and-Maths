rm(list = ls())
source('binSearch.R')
source('linSearch.R')
# Evaluate the execution cost for search functions
# The search will be executed on a sorted sequence: the odd naturals up to "size"
# The target will be randomly selected from the sequence, adding on with a given 
#    probability, to simulate the probability of not found
#    the search will be repeated to compensate random effects on execution times
# 
# Parameters:
#   trial_sizes: sequence of data sizes to try
#   search_fun:  the search function
#   step      :  step of the sequence generation, starting from 1 with step 2 will generate the odds
#   rep       :  repetition factor to regularize the times
#   prob_not_found: simulation of not found
# Algorithm
# function searchPerf(trial_sizes, search_fun, step, rep, prob_not_found):
#   initialize elapsed as numeric vector of length trial_sizes
# 
# for each size in trial_sizes:
#   vec = sequence 1, 1+step, 1+2*step, ..., up to required size
#   
#   choose target from vec
#   with probability prob_not_found, modify target so it is not in vec
#   
#   initialize elapsed_micro as numeric vector of length rep
#   
#   for r from 1 to rep:
#     measure elapsed time of search_fun(vec, target)
#   store measured time in elapsed_micro[r]
#   
#   elapsed[current size] = average(elapsed_micro)
#   
#   return elapsed

searchPerf <- function(trial_sizes, search_fun, step=2, rep=10, prob_not_found=0.5){
  elapsed <- vector(mode = "numeric", length = length(trial_sizes))
  names(elapsed) <- trial_sizes
  for (size in seq_along(trial_sizes) ){
    vec <- seq(1,trial_sizes[size]*step,step)
    target <- sample(vec, 1) + sample(0:1, size = 1, prob = c(prob_not_found,1-prob_not_found))
    elapsed_micro <- vector(mode = "numeric", length = rep)
    for (r in 1:rep){
      elapsed_micro[r] <- system.time(result <- search_fun(vec, target))['elapsed']
    } # for size
    elapsed[size] <- sum(elapsed_micro)/rep
  }
  return(elapsed)
} # searchPerf - end

# =================
# test program

trial_sizes <- 10^(4:8)

elapsed_lin <- searchPerf(trial_sizes, linSearch)
elapsed_bin <- searchPerf(trial_sizes, binSearch)

plot(trial_sizes, elapsed_lin,
     type = "l",                 # line plot
     col = "blue",
     log = "x",                  # scala logaritmica sull'asse x
     xlab = "Trial size",
     ylab = "Elapsed time")

lines(trial_sizes, elapsed_bin,
      col = "red")

legend("topleft",
       legend = c("Linear", "Binary"),
       col = c("blue", "red"),
       lty = 1)
