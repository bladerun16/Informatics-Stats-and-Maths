rm(list = ls())

# Parameters
# df: data frame to sort
# sc: sort column index
# w.r.t. the vector version, each reference to an element of x
#        is changed by considering the second index
selectionSortDf <- function(x, sc)
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
    # for j ended
    # now mini contains the position of the minimum 
    #  between i and lenx
    # swap values in position i and mini, if different
    if (i != mini) {
      tmp <- x[i,]
      x[i,] <- x[mini,]
      x[mini,] <- tmp
    } # swap - end
  } # for i - end
  return(x)
}

##########################
# bubble sort Data Frame #
##########################
# Idea 1: compare each element whit the following, 
# from the first to the one before last, 
# if they are unordered swap them
# bigger element will move towards the end
# Idea 2: repeat if the last loop has changed something
# if the last loop did not change anything 
# then the vector is sorted
# Parameters: 
# - x: a data frame
# - sc: the number of the sorting column
# Use:
# - i: index on the data frame
# - change: a boolean to annotate if the current loop has
#           made any change
# Algorithm:
# - repeat 
#   - repeat varying i over all the rows of x but the last one
#   - set change to false
#   - compare position i with position i+1, if they are
#     in the wrong order, then swap them and 
#     set change to true
# - repeat if change is true
# - now x is sorted and stop

bubbleSortDf <- function(x, sc){
  if (nrow(x)<=1) return(x)
  repeat{
    changes <- FALSE
    for (i in 1:(nrow(x)-1)){
      if (x[i,sc] > x[i+1,sc]){
        tmp <- x[i,]
        x[i,] <- x[i+1,]
        x[i+1,] <- tmp
        changes <- TRUE
      }
    } # for (i in 1:(nrow(x)-1))
    if (!changes){
      break
    }
  } # repeat
  return(x)
}
#setwd("/Volumes/Sartori/informatics-work/R-class")
gdp2014 <- read.csv("example028_gdp2014.csv",
                    sep = ";", 
                    stringsAsFactors = FALSE,
                    header = TRUE)


# head(gdp2014)
# df1 <- selectionSortDf(gdp2014,4)
# View(df1)
# df <- data.frame(a=c(3,2,1),b=c(30,20,10))
# df2 <- bubbleSortDf(df,1)
df2 <- bubbleSortDf(gdp2014,3)
View(df2)
