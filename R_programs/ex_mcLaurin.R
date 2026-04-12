rm(list = ls())

ex_mcLaurin <-
function(v, prec = 10E-15) {
    t <- 1
    ex <- t
    i <- 1
    while (abs(t / ex) >= prec) {
      t <- t * x / i
      ex <- ex + t
      i <- i + 1
    }
    return(list(result = ex, iterations = i)) # computed value is passed as result
  } # ex_mclaurin - end

