A <- as.double(readline("Insert the initial amount  "))
r <- as.double(readline("Insert the interest rate   "))
n <- as.integer(readline("Insert the number of years "))
Af <- A
for (i in 1:n){
  Af <- Af*(1+r)
}
cat("Starting value  ",A, "\n")
cat("Interest rate   ",r, "\n")
cat("Number of years ",n, "\n")
cat("Final amount    ",Af,"\n")
