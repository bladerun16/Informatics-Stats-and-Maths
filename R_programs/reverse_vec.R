rm(list=ls())
# reverse a vector
# parameter:
#  iv: input vector
# output:
#  ov: output vector
# use:
#  i: index to scan iv
#  n: length of iv

# algorithm:
# store in n the length of iv
# prepare an output empty vector of length n
# repeat varying i on all the positions of the input vector
#   store i-th position of iv into (n-i)th position of ov
# return ov
reverse <- function(iv){
  n <- length(iv)
  ov <- vector(mode = mode(iv), length = n)
  for (i in seq_along(iv)){
    ov[n-i+1] <- iv[i]
  } # for (i in seq_along(iv))
  return(ov)
} # reverse - end

# test program
l = c("good", "fair", "sufficient", "poor", "bad")
print(reverse(l))
