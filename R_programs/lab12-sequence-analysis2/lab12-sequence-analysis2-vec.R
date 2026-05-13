rm(list = ls())
# Sequence analysis - non decreasing
# Write in R a function which, given a sequence of numbers, 
# returns returns the value and the position of each number 
# concluding a non decreasing sequence. 
# The last sequence is considered open and does not generate 
# a concluding value
#
# #########################
# seq.analysis2           #
#    vectorized           #
# #########################
# Length of input sequence must be not less than 2
# In order to vectorize, we must observe that 
# each element (starting from the second) of the input vector
# is compared with the following one. 
# To vectorize this comparison we need a copy of the 
# input vector where the elements are shifted left
# Example:
#    input - 20 50 50 10 40 40 30 20
#    copy  - 50 50 10 40 40 30 20
# Observation:
#    - after the copy, the input sequence does not need 
#     the last element anymore, therefore the input sequence 
#     can be cut at the end, in order to have input and copy
#     of the same length
# Example:
#    input - 20 50 50 10 40 40 30
#    copy  - 50 50 10 40 40 30 20
#    result of input > copy
#            F  F  T  F  F  T  T
# 
# Parameters: 
#   s: vector of numbers
# Output: 
#   p: data frame of pairs <value, position>
# Uses:
#   tmp: auxilary vector
# Algorithm:
#  store in tmp a copy of s with the values shifted left by one position
#  cut the last element of s
#  rewrite tmp with the result of the comparison
#       s > tmp - it is true for each last element of a
#                 non-decreasing sequence
#  create a dataframe p with two columns:
#        value = the values of s corresponding to tmp true
#        position = the indexes where tmp is true
#  return p
#
seq.analysis2 <- function(s){
  tmp <- s[-1] # tmp is s shifted left
  s <- s[-length(s)]
  tmp <- s > tmp
  p <- data.frame(value = s[tmp], position = which(tmp))
  return(p)
} # seq.analysis - end

# Main: test program
#  read data from file into a vector
#  call seq.analysis2 and store result into data frame sa
#  print sa

setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
s <- scan("lab12-sequence-analysis2.txt")
if (length(s) < 2){
  cat("Sequence length less than 2: nothing to analyse\n")
  } else {
  sa <- seq.analysis2(s)
  print(sa)
  }
