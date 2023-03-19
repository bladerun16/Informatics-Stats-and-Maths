set_union <- function(v1,v2){
  # returns the union of two vectors;
  # elements present in both input vectors are included only once in the result
  # 
  # simply obtained by combining the input vectors and returning
  # the unique values
  # requires: set_unique
  return(set_unique(c(v1,v2)))
} # end: set_union
