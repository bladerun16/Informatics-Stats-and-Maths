# #############
# set_equal   #
# #############
set_equal <- function(v1, v2){
  # returns true iff v1 and v2 represent the same set
  # assume that both do not contain duplicates
  # (i.e. they represent proper sets)
  # parameters: 
  # - v1, v2 vectors of the same length and mode
  # output:
  # - true iff v1 and v2 represent the same set
  # algo:
  # - if the modes are different or the lenghts are different
  #   - return false
  # - repeat varying i over all the elements of v1
  #   - if i-th of v1 is not included in v2
  #     - return false
  # - since the lengths are equal, v1 and v2 are proper
  #     sets and no element of v1 is not included in v2 
  #     we can return true
  # requires: set_subset
  if (length(v1) != length(v2) | mode(v1) != mode(v2))
    return(FALSE)
  for(i in seq_along(v1))
    if(!set_subset(v1[i],v2))
      return(FALSE)
  return(TRUE)
} # end: set_equal
