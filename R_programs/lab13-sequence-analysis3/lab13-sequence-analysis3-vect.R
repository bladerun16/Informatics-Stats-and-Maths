rm(list = ls())
# Sequence analysis - minimal distances - vectorized
# Given a sequence of numbers and a reference number,
#   write a function which gives the the two values of 
#   minimal (distinct) distance from the reference
# In a first round it finds the value min1 with minimal distance minD1
# In a second round it finds the value whose distance is minimal among
#   those whose distance is different from minD1
# If two values have the same minimal distance, keeps the first found
# in the sequence
#
# #########################
# seq.min.dist            #
#    vectorized           #
# #########################
# Parameters: 
#   s: vector of numbers
#   R: reference number
# Output: 
#   list of the two minimal values: min1 and min2
#   deals with the special cases, returning null where appropriate
#   1. the input vector is empty              -> NULL
#   2. the input vector has only one element  -> min1, NULL
#   3. there is no "second minimal distance" element -> min1, NULL
#      e.g. because all the elements have the same distance from R
#   
# Uses:
#   min1, min2 : the values with minimal and second minimal distance from R 
#   minD1, minD2: the respective distances
# Algorithm:
#  if no data in s 
#    return NULL
#  store in vector dist the distances of the values in s from R
#  compute minD1 as the minimum of dist
#  find the index of the first value whose distance from R is minD1,
#     and then find min1
#  compute minD2 as the minimum of dist not considering values
#     with distance equal to minD1
#  find the index of the first value whose distance from R is minD2
#     and then find min2
#  return min1 and min2
#
nearest <- function(s, R){
  if (length(s) == 0)
    return(NULL)
  # first round: find min1 and minD1
  dist <- abs(s - R)
  minD1 <- min(dist)
  min1 <- s[min(which(dist == minD1))]
  # second round: find min2
  # delete from s and dist the element with distance minD1
  s <- s[dist != minD1]
  dist <- dist[dist != minD1]
  # if no second minimum set min2 to NULL
  if (length(s) == 0){
    min2 <- NULL
  } else {
    minD2 <- min(dist[dist != minD1])
    min2 <- s[min(which(dist == minD2))]
  }
  return(list(min1 = min1, min2 = min2))
} # nearest - end

# Main: test program
#  read data from file into vector s
#  call "nearest" and store result into data frame nst 
#  visualize the content of nst, considering also the special cases:
#    if nst is NULL deal with the case of empy input dataset
#    if min2 is NULL deal with the case of non-existent second nearest

setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
# 
#setwd("M:/Sartori/informatics-R-lab")
s <- scan("lab13-sequence-analysis3-e.txt")
# try files ending with -a, -b, -c, -d, -e for the special cases
nst <- nearest(s, 5)
if (is.null(nst)){
  cat("Dataset empty\n")
} else {
  cat("Nearest", nst$min1, "- Second nearest ")
  if (is.null(nst$min2)){
    cat("is NULL\n")
  } else cat(nst$min2, "\n")
}
