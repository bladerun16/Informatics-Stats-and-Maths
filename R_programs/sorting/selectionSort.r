rm(list = ls())

# ################## #
# selectionSort      #
# ################## #
# parameter: x - vector to be sorted
# use: lenx - length of the vector
#      i - index to scan the vector in main loop
#          it is the starting position of the subvector where
#          the minimum is searched
#      j - index to scan the subvector in the secondary loop
#      mini - position of the minimum value in the subvector
#      tmp - support variable for the swap
# algo:
# - for all the positions i from the first
#   to the last minus 1
#   - find position mini of the minimum of positions
#     from i to last
#   - swap the positions i and mini
selectionSort <- function(x)
{
  lenx <- length(x)
  if (lenx < 2)
    return(x) # no need to sort
  # continuing only if lenx >= 2
  # consider all subvectors starting from i
  for (i in 1:(lenx - 1)) {
    # finds position of minimum in subvector
    mini <- i
    for (j in (i + 1):lenx){
      if (x[j] < x[mini]){
        mini <- j
      }
    }
    # to put minimum at the beginning of subvector
    # swap values in position i and mini, if different
    if (i != mini) {
      tmp <- x[i]
      x[i] <- x[mini]
      x[mini] <- tmp
    }
      # now the minimum from i to end in in pos i
  } # for (i in 1:(lenx - 1)) 
  return(x)
} # selectionSort: end

# Alternative version, with function to find the minimum in subvector
# finds minimum value in the tail of a vector x
# the tail starts in position start
# 1 <= start < length(x)
find.min <- function(x, start) {
  m <- start
  for (i in (start + 1):length(x))
    if (x[i] < x[m])
      m <- i
    return(m)
}

selectionSort_w_find_min <- function(x)
{
  lenx <- length(x)
  if (lenx < 2)
    return(x) # no need to sort
  # continuing only if lenx >= 2
  for (i in 1:(lenx - 1))
  {
    mini <- find.min(x, i)
    # swap values in position i and mini, if different
    if (i != mini) {
      tmp <- x[i]
      x[i] <- x[mini]
      x[mini] <- tmp
    }
  }
  return(x)
}

