# test program

source("ex_mcLaurin.R")

x <- as.double(readline("Insert x "))

# precision not passed, using default

r <- ex_mcLaurin(x) # the return value is a list

cat("Exponential of ",x,
    " : ",r$result,
    " - Iterations : ",
    r$iterations,"\n")
