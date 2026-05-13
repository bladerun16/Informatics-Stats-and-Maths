rm(list = ls())
# Sequence analysis - minimal distances
# Given a sequence of numbers and a reference number,
#   write a function which gives the the two values of 
#   minimal (distinct) distance from the reference
# In a first round it finds the value min1 with minimal distance minD1
# In a second round it finds the value whose distance is minimal among
#   those whose distance is different from minD1
# If two values have the same minimal distance, keeps the first found
# in the sequence
# Deal correctly with the special cases:
# 1. the input vector is empty
# 2. the input vector has only one element
# 3. there is no "second minimal distance" element -> min1, NULL
#    e.g. because all the elements are equal
# 4. the element with minimal distance is in the first position
#
# #########################
# seq.min.dist            #
# #########################
# Parameters: 
#   s: vector of numbers
#   R: reference number
# Output: 
#   list of the two minimal values: min1 and min2
#   deals with the special cases, returning null where appropriate
#   1. the input vector is empty              -> NULL
#   2. the input vector has only one element  -> min1, NULL
#   3. the element with minimal discance is in the first position
#   4. there is no "second minimal distance" element -> min1, NULL
#      e.g. because all the elements have the same distance from R
#   
# Uses:
#   i: to scan the input vector
#   min1, min2 : the values with minimal and second 
#       minimal distance from R 
#   minD1, minD2: the respective distances
#   Di: distance of the i-th value in s
# Algorithm:
#   if s is empty 
#     return NULL
#   min1 <- s[1] as temporary minimum and compute minD1
#   if s has length 1 returns min1 and return NULL for min2
#   repeat varying i on s, excluding the first element
#     compute distance Di between s[i] and R
#     if Di is less than minD1
#       store s[i] in min1
#       store Di in minD1
#   set min2 to NULL
#   look for the first element in s whose distance form R is
#       different from minD1 and store it in min2, with distance minD2
#   if min2 is not NULL
#     repeat varying i on s
#       compute distance Di between s[i] and R
#       if Di is different from minD1 and is less than minD2
#         store s[i] in min2
#         store Di in minD2
#  return min1 and min2
#
nearest <- function(s, R){
  # if vector is empty return NULL
  if(length(s) == 0)
    return(NULL)
  # first round: find min1 and minD1
  # initialize tentative minimum
  min1 <- s[1]
  minD1 <- abs(min1 - R)
  for(i in seq_along(s)){
    # the pass with i=1 will be useless, but in this way
    # we do not need a special case for length(s)=1
    Di <- abs(s[i] - R)
    if (Di < minD1){
      min1 <- s[i]
      minD1 <- Di
    } # if (Di < minD1)
  } # for(i in seq_along(s))
  #
  # second round: find min2 and minD2
  # Initialize min2
  min2 <- NULL
  for (i in seq_along(s)){
    if (abs(s[i] - R) != minD1)
      min2 <- s[i]
  }
  # if all the elements have distance minD1 there is no second minimum
  # therefore the "if" in the loop above will never be true
  # and min2 will remain NULL
  if (!is.null(min2)) {
    minD2 <- abs(min2 - R)
    for (i in seq_along(s)) {
      Di <- abs(s[i] - R)
      if (Di != minD1 && Di < minD2) {
        min2 <- s[i]
        minD2 <- Di
      } # if (Di != minD1 && Di < minD2)
    } # for (i in seq_along(s))
  } #if (!is.null(min2))
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
# try files ending with -a, -b, -c, -d, -e for the special cases
s <- scan("lab13-sequence-analysis3-e.txt")
# call the analysis function
nst <- nearest(s, 5)
if (is.null(nst)){
  cat("Dataset empty\n")
} else {
  cat("Nearest", nst$min1, "- Second nearest ")
  if (is.null(nst$min2)){
    cat("is NULL\n")
  } else cat(nst$min2, "\n")
}
