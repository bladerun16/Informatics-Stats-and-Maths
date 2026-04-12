# #############
# set_diff    #
# #############
set_setdiff <- function( v_pos # vector from which we subtract
                         ,v_neg # vector to be subtracted
){
  # returns all the elements of first argument (v_pos) 
  # which are not contained in second argument (v_neg)
  # parameters:
  # - v_pos, v_neg vectors of the same mode
  # output:
  # - v difference or NA
  # algo:
  # - if modes are differetn return NA
  # - if either of the v_pos or v_neg is empty
  #   - return the v_pos
  # - initialize result to empty vector
  # - repeat varying i along v_pos
  #   - if the i-th element of v_pos is not contained in v_neg
  #     - add the element to result
  # -  return result
  # requires:set_subset
  if (mode(v1) != mode(v2))
    return(NA)
  
  if(length(v_pos) == 0 || length(v_neg) == 0)
    return(v_pos)

  result <- vector(mode = mode(v_pos))
  for(i in seq_along(v_pos))
    if (!set_subset(v_pos[i],v_neg))
      result <- c(result,v_pos[i])
  return(result)
} # end: setdiff_vec
