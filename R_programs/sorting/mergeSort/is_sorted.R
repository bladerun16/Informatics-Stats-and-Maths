is.Sorted <- function(a){
  if (length(a) == 1)
    return(T)
  sorted <- T
  for(i in 2:length(a))
    if(a[i] < a[i-1])
      return(F)
  return(T)
}