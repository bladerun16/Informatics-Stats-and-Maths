N1 <- 10 # lower bound allowed
N2 <- 20 # upper bound allowed
repeat {
  n <- as.integer(readline(paste("Insert a number between", N1," and",N2, ": ")))
  if (N1 <= n & n <= N2)
    break # if n is in range, loop ends
  cat("value out of range\n")
} # end of repeat
cat("Great, you did it! Input value: ", n)
