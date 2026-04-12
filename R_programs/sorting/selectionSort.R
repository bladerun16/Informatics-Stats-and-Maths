selectionSort <- function(x)
{
  ############################################################
  # DESCRIPTION:
  # Selection Sort is a simple comparison-based sorting algorithm.
  # It works by repeatedly selecting the smallest element from the
  # unsorted portion of the vector and moving it to its correct
  # position at the beginning.
  #
  # The algorithm divides the vector into two parts:
  # 1. A sorted portion (at the beginning)
  # 2. An unsorted portion (the rest of the vector)
  #
  # At each iteration:
  # - Find the minimum element in the unsorted portion
  # - Swap it with the first element of the unsorted portion
  #
  # VARIABLES:
  #
  # x     : numeric (or comparable) vector to be sorted
  # lenx  : length of the vector x
  # i     : index marking the boundary between sorted and unsorted parts
  #         (current position where the next minimum will be placed)
  # j     : index used to scan the unsorted portion of the vector
  # mini  : index of the minimum element found in the unsorted portion
  # tmp   : temporary variable used for swapping elements
  ############################################################
  
  # Get length of the input vector
  lenx <- length(x)
  
  # If the vector has fewer than 2 elements, it is already sorted
  if (lenx < 2) 
    return(x)
  
  # Outer loop: iterate over each position of the vector except the last
  # Each iteration places the correct element at position i
  for(i in 1:(lenx-1)){
    
    # Assume the first element of the unsorted portion is the minimum
    mini <- i
    
    # Inner loop: find the index of the minimum element
    # in the unsorted portion (from i+1 to end)
    for (j in (i+1):lenx) {
      if (x[j] < x[mini]) 
        mini <- j
    }
    
    # Swap the found minimum element with the element at position i
    # only if they are different
    if (i != mini){
      tmp <- x[i]        # Store current element
      x[i] <- x[mini]    # Move minimum element to position i
      x[mini] <- tmp     # Put stored element in previous minimum position
    }
  }
  
  # Return the sorted vector
  return(x)
} # selectionSort - end