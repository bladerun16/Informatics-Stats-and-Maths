######################
# check_increasing
#
# given a data frame returns true if the first column is increasing
#
# Parameters:
# - df: input data frame
# - c:  column to check, default 1
# Use:
# - i : pointer to rows
# Algorithm
# - if the dataframe is empty return NULL
# - if the dataframe has one row return TRUE
# - repeat for all the rows i of the dataframe starting from the second 
#   - if value in i position is smaller or equal to value in i-1 position 
#     - return False
# - return True
check_increasing <- function(df, c=1){
  if (is.null(df))
    return(NULL)
  if (nrow(df) == 1)
    return(TRUE)
  for (i in 2:nrow(df))
    if (df[i,c]<=df[i-1,c])
      return(FALSE)
  return(TRUE)
} # check_increasing - end

#######################################################
# vectorized solution
# 
# assume that the c column contains dates as strings
# - converts the vector of dates into a vector of strings
# - considers the vector two times, ignoring the last and the first element, respectively
# - compare the two vectors, if there are no violation the sum of the comparison is zero
check_increasing_dates_v <- function(df, c=1){
  if (is.null(df))
    return(NULL)
  if (nrow(df) == 1)
    return(TRUE)
  increasing_dates <- as.Date(df[,c])
  sum(increasing_dates[2:length(increasing_dates)]<= # violation condition
        increasing_dates[1:(length(increasing_dates)-1)]
      ) > 0
  
} # check_increasing - end


########################################
## test program
fn <- "data/readings.csv"
df <- read.csv(fn)
print(check_increasing(df))
