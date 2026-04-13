isSorted <- function(x){
  # x - vector
  # i - index
  # Algorithm
  # repeat varying i from 1 to lenght of x - 1
  #   if content of position i is bigger than content of position i+1
  #     return false
  # return true
  for(i in 1:(length(x)-1)){
    if (x[i]>x[i+1]){
      return(FALSE)
    } # if
  } # for i
  # if we arrive here no comparison was true
  return(TRUE)
} # isSorted - end



system.time({
  y <- selectionSort(x)
}
)
