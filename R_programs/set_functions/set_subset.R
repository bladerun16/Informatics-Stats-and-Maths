# #############
# set_subset #
# #############
set_subset <-
function(target, container){
  # returns true if first argument (target) 
  # is included in second argument (container)
  # parameters:
  # - target, container vectors 
  # use
  # found - logical variable to store the success of the search for an element
  #         of the target in the container
  # output:
  # - true or false
  # algo:
  # repeat varying i 1 to length of target
  #   set found to false
  #   repeat varying j 1 to length of container
  #     if target[i] equal to container[j]
  #       set found to true and break
  #   if not found return false
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
    } # end of external loop
    # if we arrive here the current target is in the container
    # and we check the next element in target
  } # loop on target
  return(TRUE)
}
