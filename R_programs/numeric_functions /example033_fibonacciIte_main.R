source('example033_fibonacciIte.R')

for (i in 1:20)
  cat("fibonacci(",i,") = ",fibonacciIte(i)
      , "\n"
  )
