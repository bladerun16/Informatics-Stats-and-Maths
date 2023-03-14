set_intersect <- function(v1,v2){
  # returns all the elements of first argument which are contained
  # in second argument
  # algo:
  # - if any of the two vectors is empty returns empty
  # - initialize v to empty vector
  # - repeat varying i along v1
  #   - if the i-th element of v1 is contained in v2
  #     - add the element to v
  # - return v
  # requires: set_subset
  if (length(v1) == 0 || length(v2) == 0)
    return(vector(mode = mode(v1)))
  # v1 and v2 are both non-empty
  v <- vector(mode = mode(v1))
  for (i in seq_along(v1))
    if (set_subset(v1[i],v2))
      v <- c(v,v1[i])
  return(v)
} # end: set_intersect
