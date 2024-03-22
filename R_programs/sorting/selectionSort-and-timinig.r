selectionsort <- function(v)
{
  lenv <- length(v)
  if (lenv < 2) 
  return(v) # no need to sort
  # continuing only if lenv >= 2
  for(i in 1:(lenv-1)){
    mini <- i
    for (j in (i+1):lenv)
    if (v[j] < v[mini]) mini <- j
    # swap values in position i and mini,    
    #    if different
    if (i != mini){
      tmp <- v[i]
      v[i] <- v[mini]
      v[mini] <- tmp
    }
  }
  return(v)
}

n <- 8000
v <- sample(1:n)
vs <- selectionsort(v)

r <- 10
print(system.time(replicate(r,{selectionsort(v)}) ))
