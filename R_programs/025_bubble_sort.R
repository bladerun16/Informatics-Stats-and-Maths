###########################################
# sorted                                  #
# check if parameter x is an empty vector #
# Parameter x: vector                     #
# Return: True or False                   #
# Algorithm:                              #
# - if lenght is 0 or 1 return TRUE
# - repeat for all the elements of x but the last one
#   - if current element is bigger than next one
#     - return FALSE
# - return TRUE
###########################################
sorted <- function(x){
  if (length(x)<=1){
    return(TRUE)
  }
  for (i in seq_along(x[-1])){
    if (x[i]>x[i+1]){
      return(FALSE)
    }
  }
  return(TRUE)
} # sorted - end

###########################################
# bubbleSort                              #
# return a sorted vector with bubbleSort  #
# Parameter x: vector                     #
# Return: x rearranged                    #
# Algorithm:                              #
# - if lenght is 0 or 1 return x
# - repeat if no pair of elements have been swapped
#   - set changes to FALSE
#   - repeat for all the elements of x but the last one
#     - if current element is bigger than next one
#       - swap current and next element
#       - set changes to TRUE
# - return x
###########################################
bubbleSort <- function(x){
  if (length(x)<=1) return(x)
  repeat{ # stop execution when no changes are made
    changes <- FALSE
    for (i in 1:(length(x)-1)){
      if (x[i] > x[i+1]){
        tmp <- x[i]
        x[i] <- x[i+1]
        x[i+1] <- tmp
        changes <- TRUE # changes made
      } # if (x[i] > x[i+1])
    } # for (i in 1:(length(x)-1))
    if (!changes)
      break # no changes made, end the repeat loop
  } # repeat
  return(x)
} # bubbleSort - end

###########################
# test program            #
###########################
source("024_selectionSort_fun.r")

# here we just test the sorting functions to measure running
# time, without storing the sorted vectors
n <- 10000
sortedFrac = 0.9
# prepare a vector with 
n_sorted = as.integer(sortedFrac*n)
# random data with first n*sortedFrac sorted, the final part unsorted
# all the elements in final part are bigger than elements in 
# first part
m <- c(1:n_sorted,sample.int(n-n_sorted)+n_sorted)
# m <- vector(mode = "numeric")
# m <- c(1,2,3,4,5,6,7,8,10,9)
# print(m)
# m_sorted <- bubbleSort(m)
print("Sorting partly a sorted vector")
print(paste("Selection sort ",system.time(selectionSort(m))[3]))
print(paste("Bubble sort    ",system.time(bubbleSort(m))[3]))

