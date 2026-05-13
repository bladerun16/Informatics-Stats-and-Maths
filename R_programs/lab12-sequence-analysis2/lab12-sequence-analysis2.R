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
# #########################
# Parameters: 
#   s: vector of numbers
# Output: 
#   p: data frame of pairs <value, position>
# Uses:
#   i: to scan the input vector
# Algorithm:
#  create an empty dataframe p with columns value and position
#  repeat varying i from 1 to the number of rows in s minus one
#     if s[i] > s[i+1]
#        add a new pair ad the end of p with s[i] and i
#  return p
#
seq.analysis2 <- function(s){
  p <- data.frame(  value = vector(mode = "numeric")
                  , position = vector(mode = "numeric"))
  for(i in 1:(length(s) - 1))
    if (s[i] > s[i + 1]){
      p[nrow(p)+1,] <- c(s[i], i)
    }
  return(p)
} # seq.analysis - end

# Main: test program
#  read data from file into a vector
#  call seq.analysis.non.dec and store result into data frame sa
#  print sa

setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
s <- scan("lab12-sequence-analysis2.txt")
if (length(s) < 2){
  cat("Sequence length less than 2: nothing to analyse\n")
  } else {
  sa <- seq.analysis2(s)
  print(sa)
  }
