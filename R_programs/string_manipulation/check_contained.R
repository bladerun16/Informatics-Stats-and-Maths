contains_string <- function(container, target) {
  n <- nchar(container)
  m <- nchar(target)
  
  if (m > n) {
    return(FALSE)
  }
  
  for (i in 1:(n - m + 1)) {
    match_found <- TRUE
    
    for (j in 1:m) {
      if (substr(container, i + j - 1, i + j - 1) != substr(target, j, j)) {
        match_found <- FALSE
        break
      }
    }
    
    if (match_found) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}

# Example usage
contains_string("hello world", "world")  # Output: TRUE
contains_string("hello world", "abc")    # Output: FALSE
