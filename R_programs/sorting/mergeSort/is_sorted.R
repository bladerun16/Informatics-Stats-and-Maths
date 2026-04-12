# ######################### #
# is.Sorted
# check if a vector is in ***non decreasing*** order
# Important: it returns true if two consecutive elements are equal
# ######################### #

is.Sorted <- function(a){
  if (length(a) == 1)
    return(T)
  sorted <- T
  for(i in 2:length(a))
    if(a[i] < a[i-1])
      return(F)
  return(T)
} # is.Sorted - end

# vectorized version
is.Sorted_v <- function(a){
  if (length(a) == 1)
    return(T)
  sorted <- sum(a[-1] < a[-length(a)])==0
  return(sorted)
} # is.Sorted_v - end

# ###############################
# is.Increasing
# returns true if the vector is strictly increasing
# vectorized version
# ##############################################
is.Increasing <- function(a){
  if (length(a) == 1)
    return(T)
  increasing <- sum(a[-1] <= a[-length(a)])==0
  return(increasing)
} # is.Increasing - end



# ###### test
a1 <- c(1,2,3,3)
a2 <- c(1,2,3,3,0)
a3 <- c(1,2,3,4,8)
cat("Vectorized\n")
cat(a1, " is sorted: ",is.Sorted_v(a1),"\n")
is.Sorted(a1)
cat(a2, " is sorted: ",is.Sorted_v(a2),"\n")
is.Sorted_v(a2)
cat("Loop\n")
cat(a1, " is sorted: ",is.Sorted(a1),"\n")
is.Sorted(a1)
cat(a2, " is sorted: ",is.Sorted(a2),"\n")
is.Sorted_v(a2)

cat(a1, " is increasing: ",is.Increasing_v(a1),"\n")
cat(a3, " is increasing: ",is.Increasing_v(a3),"\n")
