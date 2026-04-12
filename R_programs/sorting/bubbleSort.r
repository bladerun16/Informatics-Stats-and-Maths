bubbleSort <- function(x){
  # If the vector has 0 or 1 element, it is already sorted
  if (length(x) <= 1) return(x)
  
  repeat{
    # Flag to track whether any swap occurred in this pass
    changes <- FALSE
    
    # Loop over adjacent pairs
    for (i in 1:(length(x) - 1))
      # If elements are out of order, swap them
      if (x[i] > x[i + 1]){
        tmp <- x[i]          # store current element
        x[i] <- x[i + 1]     # move next element left
        x[i + 1] <- tmp      # place stored element to the right
        
        changes <- TRUE      # mark that a swap occurred
      } # if (x[i] > x[i+1])
    
    # If no swaps occurred in the entire pass, the vector is sorted
    if (!changes) break
    
  } # repeat
  
  # Return the sorted vector
  return(x)
} # bubbleSort - end
