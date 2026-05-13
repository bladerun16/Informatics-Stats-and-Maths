rm(list = ls())
# Sequence analysis - vectorized version
# Write in R a function which, given a positive number M 
#     and a sequence of numbers, returns a sequence of pairs 
# 
# <exceeding, position>
#   
# such that: 
# <exceeding> contains all the numbers whose distance from the preceding number (in the input sequence) exceeds M%, and 
# <position> is the position, in the input sequence, of the exceeding number
#
# #########################
# seq.analysis            #
#     vectorized          #
# #########################
# In order to vectorize, we must observe that 
# each element (starting from the second) of the input vector
# is compared with the previous one. 
# To vectorize this comparison we need a copy of the 
# input vector where the elements are shifted right.
# Example:
#    input - 20 25 27 29 40 30
#    copy  -    20 25 27 29 40
# Observations:
#   - the copy does not need the last element
#   - the input vector and the copy must have the same length, 
#     therefore we repeat in the copy the first input element;
#     in this way the first comparison will fail
# Example:
#    input - 20 25 27 29 40 30
#    copy  - 20 20 25 27 29 40
#    result of input > copy
#            F  T  T  T  T  F
# 
# Parameters: 
#   s: vector of numbers with not less than two elements
# Output: 
#   p: data frame of pairs <exceeding, position>
# Uses:
#   tmp: auxilary vector to store the copy of the input and the
#        result of the comparison
# Algorithm:
#  consider two copies of s, one leaving out the first element,
#     the other leaving out the last one;
#  comparing element by element the two copies is the same as
#     comparing two consecutive elements of the original sequence
#  store in tmp the result of the comparison
#     abs((s - s_1) / s_1) * 100 > M
#  now tmp is a boolean vector with true in the positions
#     where the value exceeds the previous one by M%
#  add a FALSE at the beginning of tmp, since the first element
#     of s will never be shown
#  create a dataframe p with two columns:
#     exceeding = the values of s corresponding to tmp true
#     position = the indexes where tmp is true
#  return p
#
seq.analysis <- function(s){
  copy <- s[-length(s)]
  tmp <- s[-1] < copy
  # tmp is a boolean vector with the results of the comparisons

  # add a FALSE to the beginning of tmp, since the first element is not
  # shown
  tmp <- c(FALSE, tmp)
  p <- data.frame(exceeding = s[tmp], position = which(tmp))
  # which() returns the indexes where its argument is true
  return(p)
} # seq.analysis - end

# Main: test program
#  read data from file into a vector
#  call seq.analysis and store result into data frame sa
#  print sa

#setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
s <- scan("lab11-sequence-analysis.txt")
# n <- 1000000
# s <- sample.int(100, n, replace = TRUE)
if (length(s)<2){
  cat("Less than two input data: nothing to do\n")
} else {
  sa <- seq.analysis(s)
  print(nrow(sa))
}
