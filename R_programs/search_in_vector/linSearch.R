# Linear search on sorted list
# Parameters:
#  searchList: vector containing the sorted values to be searched 
#  target: value to search
# Use:
# pos: integer containing the current search position
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
# - repeat varying pos on all the positions of the list
#   - if target==searchList[pos]
#     - return with position<- pos and found<-true
#   else
#   - if target > searchList[pos]
#     - return with position<-pos and found <- false
# - output position <- length of list+1 and found <- false

linSearch <- function( searchList, target){
  result <- list(position = 0, found = FALSE 
                 )
  for (pos in seq_along(searchList)) {
    if (searchList[pos] == target) {
      result$position <- pos
      result$found <- TRUE
      return(result) # exit from the procedure
    } # if searchList[pos] == target
    if (searchList[pos] < target){
      result$position <- position
      result$found <- FALSE
      return(result)
    } # if searchList[pos] < target
  } # while (start <= end)
  # if we come here we did not find the target
  result$position <- length(searchList) + 1
  result$found <- FALSE
  return(result)
} # binSearch: end

