rm(list=ls())
# guarantee that input is inside some interval
# - set the limits into variables N1 and N2
# - input n with appropriate prompt
# - repeat if n is not inside the limit
#   - write an error message
#   - input n with appropriate prompt
# - write a message of successful input
N1 <- 10 # lower bound allowed
N2 <- 20 # upper bound allowed
n <- as.integer(readline(paste("Insert a number between",
                               N1," and",N2, " ")))
while(!(N1 <= n & n <= N2)) {
  cat("value out of range\n")
  n <- as.integer(readline(paste("Insert a number between",
                                 N1," and",N2, " ")))
}
cat("The value ",n," is inside the limits\n")
 