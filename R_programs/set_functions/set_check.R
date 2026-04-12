set_check <- function(v){
  # parameter:
  # v - vector
  # use:
  # i, j - indexes for external and internal loops
  # return:
  #     true or false
  # repeat varying i from 1 to n-1
  #   repeat varying j from i+1 to n
  #     if v[i]==v[j]
  #       return false
  # return true
  n <- length(v)
  if (n==0){
    return(TRUE)
  }
  for (i in seq_len(n-1)){
    for (j in (i+1):n){
      if (v[i]==v[j]){
        return(FALSE)
      } # violation found, return F
    } # internal loop
  } # external loop
  return (TRUE) # if there is no violation returns T
} # check_set - function ends
