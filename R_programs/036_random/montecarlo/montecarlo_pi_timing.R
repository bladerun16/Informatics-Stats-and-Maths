# Montecarlo timing 
# repeatedly calls the Monte Carlo simulation
# and collects triplets: n, elapsed, error
# Uses:
# from, to: extremes for the exponents to compute n
# results: data frame for the triplets
# 
# Algorithm:
# - set the random seed
# - import the function
# - set from and to
# - compute len, the length of the sequence
# - initialize the results data frame
# - repeat varying i from "from" to "to"
#   - compute n as 10 elevated to i
#   - compute the index for the data frame rows
#   - store n in the appropriate column in the index row
#   - call the function with timing and store the 
#     elapsed time in the appropriate column and row
#   - compute the error and store it in the appropriate 
#     column and row
# - now results contains all the desired values
rm(list = ls())
source("montecarlo_pi_fun.R")
set.seed(42)
from <- 4
to <- 7
len <- to - from +1
results <- data.frame(throws = integer(len)
                      , timing = double(len)
                      , error = double(len)
                      )
for (i in from:to){
  n <- 10^i
  index <- i - from + 1
  results$throws[index] <- n
  results$timing[index] <- 
    system.time({pi_est <- pi_estimate(n)})[3] * 1000.
  results$error[index] <- abs((pi_est-pi)/pi)
}
plot(results$throws                     # x
     , results$timing          # y
     , type = "b"
     , axes = F
     # , xlab = "Number of throws"
     # , ylab = "Elapsed time (milliseconds)"
     , xlab = ""
     , ylab = ""
     , main = "Computation of pi with Monte Carlo method"
     , log = "xy")
axis(2, ylim = c(results$timing[1]
                 ,tail(results$timing,1))
     , col = "black"
)
par(new = T) # next plot will add elements to the previous one
plot(results$throws                     # x
     , results$error              # y
     , type="b"
     , xlab = "Number of throws"
     , ylab = ""
     , col = "red"
     , axes = F
     , log = "x")
axis(4, ylim = c(results$error[1]
                 ,tail(results$error,1))
     , col = "red"
)
axis(1, ylim = c(results$throws[1]
                 ,tail(results$throws,1))
     , col = "black"
)
legend("top", c("Elapsed time (msec)"
                , "Error")
       , text.col=c("black","red")
       ,pch=c(5,5)
       ,cex = 0.75
       ,col=c("black","red"))

