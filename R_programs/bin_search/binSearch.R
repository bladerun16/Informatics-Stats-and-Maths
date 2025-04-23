# Binary search
# Parameters:
#  searchList: vector containing the 
# sorted values to be searched 
# target: value to search
# Use:
# start, end: integers indicating the 
#         start and the ending indexes ofthe scope
# center: index of the center of the 
#         current scope
# result: 
#   found: boolean
# position: index where value is equal to 
#         target, if found, or where the 
#         target could be inserted keeping the 
#         list sorted, if not found
# 
# Algo:
# - set start, end to the first and last 
#   element of searchList
# - repeat if start<=end  i.e. the scope is not empty
#   - compute center as (start+end)/2 using integer arithmetics
#   - if target==searchList[center]
#     - return with position<- center and found<-true
#   else
#   - if target < searchList[center]
#     - continue search with scope start:center-1
#     else
#     - continue search with scope center+1:end
#   # end of repeat
# - if searchList[center] < target
#   - the output position is center+1
#   else the output position is center
# - output found <- false

binSearch <- function( searchList, target){
  start <- 1
  end <- length(searchList)
  result <- list(position = 0, found = FALSE 
                 )
  while (start <= end) {
    center <- as.integer((start + end) / 2)
    print(searchList[center]) # test mode, to disable comment the line
    if (searchList[center] == target) {
      result$position <- center
      result$found <- TRUE
      return(result) # exit from the procedure
    }
    if (searchList[center] < target){
      start <- center + 1
    } else {
      end <- center - 1
    }
  } # while (start <= end)
  # if we come here we did not find the target
  if (searchList[center] < target){
    result$position <- center + 1
  }else {
    result$position <- center
  }
  return(result)
} # binSearch: end

