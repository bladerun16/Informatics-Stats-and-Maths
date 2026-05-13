rm(list = ls())
# find the first element with minimal distance from reference 
# and the first element with the second minimal distance from reference
# 
# s : vector
# R : reference
# d_R_s : vector of distances
# 
# Algorithm
# initialize the vector of distances d_R_s
# minD1 <- inizialize minumum distance to the maximum double in the machine 
# repeat varying i along s
#    compute the distance between R and the i-th emeent of s and store it on d_R_s
#    if the distance is smaller than minD1
#       set minD1 to the distance 
#       set min1 to i-th element of s
# ## here min1 and minD1 are as expected
# minD2 <- inizialize minumum distance to the maximum double in the machine
# min2 <- initialize to NA, in case of non existance of the second
# repeat varying i along d_R_s
#    if i-th element of d_R_s is different from minD1 and smaller than minD2
#       set minD2 to the i-th element of d_R_s 
#       set min2 to i-th element of s
# return min1 and min2

nearest <- function(s, R){
  # if vector is empty return NULL
  if(length(s) == 0)
    return(NULL)
  # first round: find min1 and minD1
  d_R_s <- vector(mode = "numeric", length = length(s))
  minD1 <- .Machine$double.xmax
  d_R_s[1] <- minD1
  for (i in 1:length(s)){
    d_R_s[i] <- abs(R - s[i])
    if (d_R_s[i] < minD1){
      minD1 <- d_R_s[i]
      min1 <- s[i]
    } # if
  } # for
  minD2 <- .Machine$double.xmax
  min2 <- NA
  for (i in seq_along(d_R_s)){
    if (d_R_s[i] != minD1 && d_R_s[i] < minD2){
      minD2 <- d_R_s[i]
      min2 <- s[i]
    } # if
  } # for
  return(list(min1 = min1, min2 = min2))
} # function nearest

# try files ending with -a, -b, -c, -d, -e for the special cases
# -a : same as the proposed example
# -b : some values are permutated, to show the robustness
# -c : just one value
# -d : all the values are at the same distance
# -e : empty file
s <- scan("lab13-sequence-analysis3-e.txt")
# call the analysis function
nst <- nearest(s, 5)
if (is.null(nst)){
  cat("Dataset empty\n")
} else {
  cat("Nearest", nst$min1, "- Second nearest ")
  if (is.null(nst$min2)){
    cat("is NULL\n")
  } else cat(nst$min2, "\n")
}
