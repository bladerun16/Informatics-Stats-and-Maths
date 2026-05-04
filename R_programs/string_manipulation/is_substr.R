# check if the target is included in the container
# parameters:
# - target
# - container
# output: T or F
# Algo:
# if the number of characters in the target nt is bigger
#    than the number of characters in the container nc return F
# - repeat varying i from 1 to nc - nt + 1
#   - extract from the container the characters from i to i+nt-1
#   - if this is equal to the target return true
# - return false
# 
contains_string <- function(container, target) {
  nc <- nchar(container)
  nt <- nchar(target)
  
  if (nt > nc) {
    return(FALSE)
  }
  
  for (i in 1:(nc - nt + 1)) {
    s <- substr(container,1,i+nt-1)
    if (s==target)
      return(TRUE)
  }
  return(FALSE)
}

# Example usage
print(contains_string("hello world", "world"))  # Output: TRUE
print(contains_string("hello world", "abc"))    # Output: FALSE