rm(list = ls())

# ##################
# quick median
# from https://rcoh.me/posts/linear-time-median-finding/
# R translation of the python procedure given there
# Caveat: the main attention point in the "Python to R" translation is that 
# here vectors are 1 based, instead of 0 based 

pivot_choice <- function(l){
  return(sample(l,1))
}
# if you use the first element instead of a random choice the 
# performance can be worse
# pivot_choice <- function(l){
#   return(l[1])
# }

# quicksearch k-th
# Strategy: 
# - choose a random pivot element, make three lists of the 
# - lows, pivots, highs
# - compare k with the lengths of lows, pivots and highs and on the basis of the
# - result make a recursion on lows or highs, or have a solution in pivots
# - the recursion must adapt the value of k
# Parameters:
# - l - vector
# - k - position searched (for the median it will be around half the length of l)
# Algo:
# - if the length of l is 1 
#   - then return the first (and only) element
# - pivot gets the value of a random position between 1 and the length of l
# - make the list of lows with the elements smaller than the pivot
# - make the list of pivots with the elements equal to the pivot
# - make the list of highs with the elements bigger than the pivot
# - if k is not bigger than the length of lows
#   - then make a recursive call with parameters lows and k (unchanged)
#   - else if k is not bigger than length of lows + length of pivots
#          - then return as pivot the first element of pivots (equal to all the others)
#          - else make a recursive call with parameters highs and k - length of lows - length of pivots
# 
quickselect_median <- function(l, pivot_fn=pivot_choice){
  if (length(l) %% 2 == 1)
    return (quickselect(l, length(l) %/% 2+1, pivot_fn))
  else
    # the 1 shift is moved for the computation of the pair of central 
    # indexes with base 1 indexes
    return (0.5 * (quickselect(l, length(l) / 2, pivot_fn) +
                    quickselect(l, length(l) / 2 + 1, pivot_fn)))
} # quickselect_median
  
quickselect <- function(l, k, pivot_fn){
    #   Select the kth element in l (1 based)
    #   :param l: List of numerics
    #   :param k: Index
    #   :param pivot_fn: Function to choose a pivot, defaults to random.choice
    #   :return: The kth element of l
  if (length(l) == 1){
    return(l[1])
  }

  pivot = pivot_fn(l)
  
  # in python the three sets are computed as list comprehensions
  # lows = [el for el in l if el < pivot]
  # highs = [el for el in l if el > pivot]
  # pivots = [el for el in l if el == pivot]
  lows <- l[l<pivot]
  highs <- l[l>pivot]
  pivots <- l[l==pivot]
  
  # with base 0 indexes the comparisons of k were a strict <
  if (k <= length(lows))
    return(quickselect(lows, k, pivot_fn))
  else if (k <= length(lows) + length(pivots))
    # We got lucky and guessed the median
    return (pivots[1])
  else
    return(quickselect(highs, k - length(lows) - length(pivots), pivot_fn))
} # quickselect - end

# set.seed(46912)
# l <- sample.int(2000,200000,replace = T)
l <- 1:200000
# print(sort(l))
print(paste("Quickselect median",quickselect_median(l)))
print(paste("Median            ",median(l)))
