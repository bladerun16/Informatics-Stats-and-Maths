rm(list = ls())
# Sequence analysis
# Write in R a function which, given a positive number M 
#     and a sequence of numbers, returns a sequence of pairs 
# 
# <exceeding, position>
#   
# such that: 
# <exceeding> contains all the numbers whose distance from 
# the preceding number (in the input sequence) exceeds M%, and 
# <position> is the position, in the input sequence, 
# of the exceeding number
#
# #########################
# seq.analysis            #
# #########################
# Parameters: 
#   M: threshold percentage
#   s: vector of numbers
# Output: 
#   p: data frame of pairs <exceeding, position>
# Uses:
#   i: to scan the input vector
# Algorithm:
#  if nrow(s) < 2 return NULL
#  create an empty dataframe p with columns "exceeding" and "position"
#  repeat varying i from 2 to the number of rows in s
#     if abs((s[i]-s[i-1])/s[i-1]) > M%
#        add a new pair at the end of p with s[i] and i
#  return p
#
# Main: test program
#  read data from file into a vector
#  call seq.analysis and store result into data frame sa
#  print sa

seq.analysis <- function(s, M){
  if (length(s)<2)
    return(NULL)
  p <- data.frame(  exceeding = vector(mode = "numeric")
                  , position = vector(mode = "numeric"))
  for(i in 2:length(s))
    if (abs((s[i]-s[i-1])/s[i-1]) * 100 > M){
      p[nrow(p)+1,] <- c(s[i], i)
    } # for(i in 2:length(s))
  return(p)
} # seq.analysis - end

seq.analysis2 <- function(s, M) {
  if (length(s) < 2)
    return(NULL)
  p <- data.frame(
    exceeding = vector(mode = "numeric"),
    excess = vector(mode = "numeric"),
    position = vector(mode = "numeric")
  )
  for (i in 2:length(s)) {
    excess <- (s[i] - s[i - 1]) / s[i - 1]
    if (abs(excess) * 100 > M) {
      p[nrow(p) + 1, ] <- c(s[i], excess, i)
    }
  } # for(i in 2:length(s))
  return(p)
} # seq.analysis - end

# Main: test program
#  read data from file into a vector
#  call seq.analysis and store result into data frame sa
#  print sa

#setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
s <- scan("lab11-sequence-analysis.txt")
# uncomment the two lines below to try with large random data
# n <- 1000000
# s <- sample.int(100, n, replace = TRUE)
sa <- seq.analysis2(s, 10)
print(sa)
