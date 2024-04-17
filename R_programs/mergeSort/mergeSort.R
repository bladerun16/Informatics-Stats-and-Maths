# mergeSort: divide and conquer strategy
#
# parameter: m - vector to sort
#
# result: a sorted vector
#
# use:
# left, right - the two parts of the vector
#
# algo:
# if length of m is not more than 1
#     return m
# compute middle position using integer arithmetic
# split m in two parts of equal size(+/-1)
# sort left part, if necessary
# sort right part, if necessary
# merge left and right into result
# return the result
mergeSort <- function(m) {
  if (length(m) <= 1)
    return(m)
  else{
    middle <- as.integer(length(m) / 2)
    left <- m[1:middle]
    right <- m[(middle+1):length(m)]
    if(length(left)>1)
      left <- mergeSort(left)
    if(length(right)>1)
      right <- mergeSort(right)
    # now left and right are sorted
# # the optimization below deals with the case when
# # the left part is completely smaller than the right part
#     if (left[length(left)] <= right[1]) {
#       left <- append(left,right)
#       return(left)
#     }
    result <- merge(left, right)
    return(result)
  }
} # mergeSort - end

# merge two sorted vectors
# parameters: left, right - two sorted vectors
#                           of the same type
# result: a sorted vector containing all the elements of
#         left and right
# uses: 
#   ll, lr - lengths of the two input vectors
#   pl, pr, pt - pointers to current position of left, right, result
# algo:
#   initialize ll and lr
#   initialize the result vector with the appropriate length and type
#   initialize the pointers to 1
#   repeat if both pl and pr still have not reached the end
#     if the current position of pl is not more 
#           than the current position of pr
#       copy the current position of left in the result
#       advance the current position of left
#     else
#       copy the current position of right in the result
#       advance the current position of right
#   if current position of left has not reached the end
#       copy the remainder of left in the result
#   if current position of right has not reached the end
#       copy the remainder of right in the result
#   return the result
merge <- function(left,right) {
  ll <- length(left)
  lr <- length(right)
  result <- vector(mode = typeof(left), length = ll+lr)
  pl <- 1 # pointer to current left position
  pr <- 1 # pointer to current right position
  pt <- 1 # pointer to current output vector
  while ( ll-pl >= 0 & lr-pr >= 0) {
    if (left[pl] <= right[pr]) {
      result[pt] <- left[pl]
      pl <- pl + 1
    } else {
      result[pt] <- right[pr]
      pr <- pr + 1
    }
    pt <- pt + 1
  } # while ( ll-pl >= 0 & lr-pr >= 0)
  # one of the vectors reached the end
  if (ll-pl >= 0)
    result[pt:(ll+lr)] <- left[pl:ll]
  if (lr-pr >= 0)
    result[pt:(ll+lr)] <- right[pr:lr]
  return (result)
}