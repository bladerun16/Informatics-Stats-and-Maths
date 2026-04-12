rm(list = ls())
# function equal_rows, true if two rows of a dataframe are equal
# parameters:
#   df    : dataframe
#   r1, r2: indexes on the dataframe
# use:
#   i: index on columns
# algorithm
# repeat varying i on all the columns of df
#   if component i of r1 is different from component i of r2
#     return false
# return true
equal_rows <- function(df, r1, r2){
  for (i in 1:ncol(df)){
    if (df[r1,i]!=df[r2,i]){
      return(FALSE)
    }
  }
  return(TRUE)
} # equal_rows - end

print(equal_rows(mtcars,1,1))
  