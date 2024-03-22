selectionSortDf <- function(x, sc) #sc=sorting column
{
  lenx <- nrow(x)
  if (lenx < 2)
  return(x) # no need to sort
  # continuing only if lenx >= 2
  for (i in 1:(lenx - 1)) {
    mini <- i
    for (j in (i + 1):lenx)
    if (x[j,sc] < x[mini,sc])
    mini <- j
    # swap values in position i and mini, if different
    if (i != mini) {
      tmp <- x[i,]
      x[i,] <- x[mini,]
      x[mini,] <- tmp
    } # swap - end
  }
  return(x)
}

compare <- function(x, p1, p2, sc1, sc2){
  if (x[p1,sc1] < x[p2,sc1] || 
      (x[p1,sc1] == x[p2,sc1] && x[p1,sc2] < x[p2,sc2])
  ){
    return(TRUE)
  }
  return(FALSE)
}

selectionSortDf_2c <- function(x, sc1, sc2) #sc=sorting column
{
  lenx <- nrow(x)
  if (lenx < 2)
    return(x) # no need to sort
  # continuing only if lenx >= 2
  for (i in 1:(lenx - 1)) {
    mini <- i
    for (j in (i + 1):lenx)
      if (compare(x,j, mini, sc1, sc2))
        mini <- j
    # swap values in position i and mini, if different
    if (i != mini) {
      tmp <- x[i,]
      x[i,] <- x[mini,]
      x[mini,] <- tmp
    } # swap - end
  }
  return(x)
}

##########################
# test program           #
##########################
df_name <- "persons.csv"
df <- read.csv(df_name)

dfs <- selectionSortDf_2c(df, 2, 1)
print(dfs)