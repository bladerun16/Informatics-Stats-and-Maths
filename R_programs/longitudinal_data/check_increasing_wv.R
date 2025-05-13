######################
# check_increasing
#
# given a data frame returns the indexes where there is a violation 
# of increasing sequence
#
# Parameters:
# - df: input data frame
# - c:  column to check, default 1
# Return: v: vector of integers with the indexes of violations
# Use:
# - i : pointer to rows
# Algorithm
# - if the dataframe is empty return NULL
# - if the dataframe has one row return an empty vector
# - create an empty vector v of integers
# - repeat for all the rows i of the dataframe from the second one
#   - if value in i position is smaller or equal to value in i-1 position 
#     - store i in the first empty position of v
# - return v
check_increasing_wv <- function(df, c=1){
  if (is.null(df))
    return(NULL)
  v <- vector(mode = "integer")
  if (nrow(df) == 1)
    return(v)
  for (i in 2:nrow(df))
    if (df[i,c]<=df[i-1,c])
      v[length(v)+1] <- i
  return(v)
} # check_increasing - end

## test program
fn <- "data/readings_ni.csv"
df <- read.csv(fn)
print(check_increasing_wv(df))
