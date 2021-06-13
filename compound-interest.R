rm(list = ls())
A <- as.double(readline("Insert the initial amount  "))
r <- as.double(readline("Insert the interest rate   "))
n <- as.integer(readline("Insert the number of years "))
Af <- A
#for (i in 1:n){
#for (i in seq_len(n)) {
i <- 0 # i is the number of execution of the loop, init. 0
while (i < n){
  Af <- Af*(1+r)
  i <- i + 1 # increment
}
cat("Starting value  ",A, "\n")
cat("Interest rate   ",r, "\n")
cat("Number of years ",n, "\n")
cat("Final amount    ",Af,"\n")