set_union <- function(v1,v2){
  # returns all the elements that are contained either in one or both the arguments
  # parameters:
  # - v1, v2 vectors of the same mode
  # output:
  # - v union or NA
  # returns the union of two vectors;
  # elements present in both input vectors are included only once in the result
  # 
  # simply obtained by combining the input vectors and returning
  # the unique values
  # requires: set_unique
  if (mode(v1)!=mode(v2))
    return(NA)
  return(set_unique(c(v1,v2)))
} # end: set_union
