# #############
# set_unique  #
# #############
set_unique <- function(v){
  #   copies in s the elements of v without duplication #
  # copy first element of v in new vector s
  # idea for solution:
  # for each element of v from the second
  #    if it is not already in s copy it in s
  # 
  # parameter:
  # v - vector
  # use:
  # s - vector representing a set
  # i, j - indexes for external and internal loops
  # return:
  #  s
  # Algoritm:
  # if v is empty 
  #     return an empty vector
  # ls <- 1
  # s[1] <- v[1]
  # repeat varying i from 2 to n
  #   found <- False
  #   repeat varying j from 1 to length of s
  #     if v[i]==s[j]
  #       found <- True
  #       break
  #   if not found
  #     ls <- ls+1
  #     append v[i] to the end of s
  # return s
  n <- length(v)
  if (n==0){
    return(vector(mode = "double")) # if input is empty returns an empty output
  }
  s <- v[1] # store in s the first element of v
            # in R a single variable is the same as a vector of length 1
  for (i in seq_len(n-1)+1){ # loop on the elements of v after the first one
    found <- FALSE
    for (j in seq_along(s)){ # loop on all the actual components of s
      if (v[i]==s[j]){
        found <- TRUE
        break
      } # v[i] already in s, no need to continue loop on s
    } # loop on s
    if (! found){
      s <- c(s,v[i]) 
    } # v[i] not in s, therefore insert it at the end of s
  } # loop on v
  return (s) # s contains the elements of v without duplication
} # set - function ends
