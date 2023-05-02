rm(list=ls())
T <- c(21, 18, 13, 18, 19, 22)
T[-1]
T[-length(T)]
T[-1]-T[-length(T)]

# sapply(T, function(i) T[i]-T[i-1]) # does not work

# Temperatures not smaller than 20
T[T>=20]
