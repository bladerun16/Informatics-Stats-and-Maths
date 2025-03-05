# function ex_mcLaurin
# parameters v: argument of the exponential
#            prec (with default): precision of the computation
# returns ex
# use t, i
# t <- 1
# ex <- t
# i <- 1
# Repeat if the absolute value of t/ex >= prec
#    t <- t * v / i
#    ex <- ex + t
#    i <- i + 1
# return ex
ex_mcLaurin <- function(v, prec = 10E-15) {
    t <- 1
    ex <- t
    i <- 1
    while (abs(t / ex) >= prec) {
      t <- t * x / i
      ex <- ex + t
      i <- i + 1
    }
    return(ex) # computed value is passed as result
  } # function ex_mcLaurin end

# test program which calls the function
cat("Computation of exponential with MacLaurin series\n")
x <- as.double(readline("Insert x "))
# p <- as.double(readline("Insert the precision "))
# precision not passed, using default
ex <- ex_mcLaurin(x)
cat("Exponential of ",x," : ",ex,"\n")
