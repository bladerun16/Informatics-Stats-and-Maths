rm(list = ls())
seq.analysis2 <- function(s){
  p <- data.frame(  value = vector(mode = "numeric")
                    , position = vector(mode = "numeric"))
  for(i in 1:(length(s) - 1))
    if (s[i] > s[i + 1]){
      p[nrow(p)+1,] <- c(s[i], i)
    }
  return(p)
} # seq.analysis - end

# Sequence analysis - non decreasing
# Write in R a function which, given a sequence of numbers, 
# returns returns the value and the position of each number 
# concluding a non decreasing sequence. 
# Returns also the average of the numbers of the non decreasing sequence
# The last sequence is considered open and does not generate 
# a concluding value
#
# #########################
# seq.analysis2b          #
# #########################
# Parameters: 
#   s: vector of numbers
#   p: data frame of positions of last elements of non decr. seq.
# Output: 
#   p: extended data frame <value, position, average of seq.>
# Uses:
#   i,j: to scan the inputs
#   ss: start of sequence
# Algorithm:
#  add a column to p for the averages 
#  initialize ss to 1
#  repeat varying i from 1 to the number of rows in p
#     initialize total to 0
#     repeat varying j from ss to the position in p[i]
#        add s[j] to total
#     store in average field of p[i] total 
#         / (position in p[i] - ss + 1)
#     store in ss position in p[i] + 1
#        
#  return p
#

seq.analysis2.avg <- function(s, p){
  p$avg <- 0
  ss <- 1
  for(i in seq_along(p)){
     total <- 0
     for(j in ss:p$position[i])
       total <- total + s[j]
     p$avg[i] <- total / (p$position[i] - ss + 1)
     ss <- p$position[i] + 1
  }
  return(p)
} # seq.analysis2.avg - end

# #########################
# seq.analysis2b.vec      #
#    vectorised version   #
# #########################
# Parameters: 
#   s: vector of numbers
#   p: data frame of positions of last elements of non decr. seq.
# Output: 
#   p: extended data frame <value, position, average of seq.>
# Uses:
#   i,j: to scan the inputs
#   ss: start of sequence
# Algorithm:
#  add a column to p for the averages 
#  initialize ss to 1
#  repeat varying i from 1 to the number of rows in p
#     store in average field of p[i] the mean of the subset
#            of s from position ss to the position in p[i]
#     store in ss position of p[i] + 1
#  return p
#
seq.analysis2.avg.vec <- function(s, p){
  p$avg <- 0
  ss <- 1
  for(i in seq_along(p)){
    p$avg[i] <- mean(s[ss:p$position[i]])
    ss <- p$position[i] + 1
  }
  return(p)
} # seq.analysis2.avg - end

# Main: test program
#  read data from file into a vector
#  call seq.analysis.non.dec and store result into data frame sa
#  print sa

#setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
#setwd("")
s <- scan("lab12-sequence-analysis2.txt")
if (length(s) < 2){
  cat("Sequence length less than 2: nothing to analyse\n")
  } else {
  sa <- seq.analysis2(s)
  print(sa)
  }
# print(seq.analysis2.avg(s,sa)) uncomment to test
print(seq.analysis2.avg.vec(s,sa))