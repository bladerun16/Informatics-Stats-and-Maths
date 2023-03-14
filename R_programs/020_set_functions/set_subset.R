set_subset <-
function(target, container){
  # repeat varying i 1 to length of target
  #   repeat varying j 1 to length of container
  #     if target[i] not equal to container[j]
  #       return F
  # return T
  for (i in seq_along(target)){
    found <- FALSE
    for (j in seq_along(container)){
      if (target[i]==container[j]){
        found <- TRUE
        break # found, end the loop on container skip to next element of target
      } 
    } # loop on container
    if (! found){
      return(FALSE)
    }
    # if we arrive here the current target is in the container
    # and we check the next element in target
  } # loop on target
  return(TRUE)
}
