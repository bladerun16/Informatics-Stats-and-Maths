bubbleSort <- function(x){
  if (length(x)<=1) return(x)
  repeat{
    changes <- FALSE
    for (i in 1:(length(x)-1))
      if (x[i] > x[i+1]){
        tmp <- x[i]
        x[i] <- x[i+1]
        x[i+1] <- tmp
        changes <- TRUE
      } # if (x[i] > x[i+1])
    if (!changes) break
  } # repeat
  return(x)
} # bubbleSort - end

