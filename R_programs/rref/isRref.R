isEchelon <-
  function(m) {
    norow <- nrow(m)
    if (norow == 1)
      return(TRUE)
    nocol <- ncol(m)
    # initialize pivot to nocol+1
    pivot <- rep(nocol + 1, norow)
    for (i in 1:norow) {
      for (j in 1:nocol)
        if (m[i, j] != 0) {
          pivot[i] <- j
          break  # jump out of the inner loop
        }
    }  # now the pivot vector is filled with
    # the positions of the leading elemens
    # or nocol+1 for zero rows
    for (i in 2:norow) {
      if (pivot[i] <= pivot[i - 1])
        # consecutive pivot violation returns false
        # unless the row i is zero, in this case pivot==nocol+1
        if (pivot[i] != nocol + 1)
          return(FALSE)
    }
    return(TRUE)
  }

isRref <-
  function(m) {
    norow <- nrow(m)
    if (norow == 1)
      return(TRUE)
    nocol <- ncol(m)
    # initialize pivot to nocol+1
    pivot <- rep(nocol + 1, norow)
    for (i in 1:norow) {
      for (j in 1:nocol)
        if (m[i, j] != 0) {
          pivot[i] <- j
          break  # jump out of the inner loop
        }
    }  # now the pivot vector is filled with
    # the positions of the leading elements
    # or nocol+1 for zero rows
    for (i in 2:norow) {
      if (pivot[i] <= pivot[i - 1])
        # consecutive pivot violation returns false
        # unless the row i is zero, in this case pivot==nocol+1
        if (pivot[i] != nocol + 1)
          return(FALSE)
    }
    for (i in 1:min(norow,nocol)){
      if (pivot[i]!=nocol+1 & m[i,pivot[i]]!=1){
        return(FALSE)
      }
      for (j in (1:nocol)[-pivot[i]]){
        if (m[i,j]!=0){
          return(FALSE)
        }
      }
    }
    return(TRUE)
  } # isRref - end

#####################
# clean             #
###################################################################
# given a matrix whose elements should be either 0 or 1           #
# transform in 0 or 1 all the elements whose distance from 0 or 1 #
# is smaller than a given tolerance                               #
###################################################################
clean <- function(m, tolerance=10e-14){
  for (i in 1:nrow(m)){
    for (j in 1:ncol(m)){
      if (abs(m[i,j])<=tolerance){
        m[i,j]<-0
      } else if (abs(m[i,j])-1 <= tolerance){
        m[i,j]<-1
      } # if ... else
    } # for (j in 1:ncol(m))
  } #for (i in 1:nrow(m))
  return(m)
} # clean

