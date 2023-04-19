######################################

# test code for selectionSort
# fills vector x with random values
# reads the current time
# repeats n times the selectionSort (to amplify the time)
# counts the elapsed time 
rm(list = ls())
source('024_selectionSort_fun.r')
n = 10000
x = sample(1:n)# generate random data
# ptm <- proc.time() # stores in ptm the current time
# for(i in 1:n) 
# x <- c(34,22,65,31,88)
ptm_st <- proc.time()
y <- selectionSort(x)
ptm_end <- proc.time()
print(proc.time() - ptm_st)

# print(check_non_decreasing(y))

# design an experiment which collects elapsed times for sorting
# vectors of varying sizes
# 

