## ====== data and software preparation, do it only once, then comment
# rm(list = ls())
# source("selectionSort.R")
# x = sample(1:100000000)
## ====== preparation end
## ====== function test
# system.time() executes the sequence in {} and returns a triplet
# of values:
# **user**:   CPU time spent executing your R code in user space 
#             (your computations).
# **system**: CPU time spent in the OS on behalf of your code 
#             (e.g., memory allocation, I/O, system calls).
# **elapsed**: real wall-clock time from start to finish 
#             (what a stopwatch would measure).
# 
print(system.time({
  y <- sort(x)
})["elapsed"]
)

start <- 4
stop <- 7
step <- 0.5
steps <- seq(start,stop,step)
xvals <- as.integer(10^steps)
elapsed <- numeric(length = length(xvals))
for (i in 1:length(steps)){
  x = sample(1:as.integer(10^steps[i]))
  elapsed[i] <- system.time({
    y <- sort(x)
  })["elapsed"]
}

plot(xvals,elapsed, log = "x", xaxt = "n")
axis(1, at = xvals, labels = format(xvals, scientific = FALSE), las = 2, cex.axis = 0.7)
