rm(list = ls())
source("equal_rows.R")
# N.B.
# This implementation is given only as a programming 
# exercise
# The R programming language includes extensive and 
# robust implementations for set operations which 
# are able to operate on any kind of data structure
#

# ################ #
# unique elements  #
# ################ #
# returns a dataframe with the unique rows 
# of the input dataframe
# description: 
# - use a boolean vector initialized to TRUE to keep track 
#    of the rows to keep in output
# - with a double loop compare the rows and in case 
#    set to false the corresponding element in the
#    boolean vector
# - at the end keep only the surviving rows
#    
# Parameter:
# - df :   data frame
# - reset_rownames : boolean, if true the row names 
#                    of the output dataframe are renumbered
# Use:
# - keep : boolean vector to store if a row is duplicated or not
# - i, j : indexes
# Algorithm:
# - if the length of df is 1 return df
# - initialize keep to TRUE repeated nrow of df times
# - repeat varying i from the first row to the last minus 1
#   - repeat varying j from i+1 to the last row
#     - set eq <- TRUE
#     - repeat varying k from 1 to the number of columns
#       - if element k of row i not equal to 
#                   element k of row j
#         - set eq to FALSE
#         - break
#     - if eq is TRUE there is a duplication, then set the j-th 
#       element of keep to FALSE
# - copy in u the rows of df corresponding to keep = TRUE
# - if requested to reset row names do it in u
# 
# Caveat: 
# - there are implementations more efficient 
#   than this
# - the R function unique() is available in R
unique_el <- function(df, reset_rownames = TRUE){
  if (nrow(df) == 1){
    return(df)
  }
  keep <- rep(TRUE, nrow(df)) # keep vector initialized to T
  for (i in 1:(nrow(df) - 1)) {
    if (keep[i]){# the element must not be eliminated
      for (j in (i + 1):nrow(df)) {
        if (equal_rows(df,i,j)){ # if rows i and j are equal then j is duplicate
          keep[j] <- FALSE
        } # if equal_rows
      } # for (j in (i + 1):nrow(df))
    } # if keep is true
  } # for (i in 1:(nrow(df) - 1))
  u <- subset(df, keep)
  if (reset_rownames){ # the rownames of the output dataframe
                       # are reset to consecutive numbers
    rownames(u) <- seq_len(nrow(u))
  }
  return(u)
} # unique_el - end

######################
# intersection       #
######################
# Computes the intersection of two dataframes having 
#       the same structure
# Method: compare each row of one dataframe with each row 
# of the other; in case of matching pair puts one of the 
# two in the output
# Parameters:
# - df1, df2: dataframes with the same structure and 
#             without duplicates
# Output: the intersection, with the row numbers reset
# Uses:
# i, j, k:  indexes
# eq_row:   boolean to store if two rows are equal
# keep:     vector of booleans: same length of the dataframe
#           used in the internal loop
# Algorithm:
# - if either of the two dataframes is empty return NULL
# - initialize keep to FALSE repeated for each element
#     of the dataframe df2, used in the internal loop
# - repeat varying i over all the rows of df1
#   - repeat varying j over all the rows of df2
#     - if already decided to keep j skip break out of the
#       internal loop on j
#     - initialize eq_row to TRUE
#     - repeat varying k over all the columns of the dataframes
#       - if the field k in the rows i and j of df1 and df2
#         are different
#         - set eq_row to FALSE and break the loop on k
#     - if eq_row is TRUE set j-th position of keep to TRUE
# - now keep is TRUE for all the elements of df2 which represent
#   the intersection
# - filter df2 accordigly, reset row names and return the result
intersection <- function(df1,df2){
  if (nrow(df1) == 0 || nrow(df2) == 0){
    return(NULL)
  }
  keep <- rep(FALSE, nrow(df2))
  for (i in seq_len(nrow(df1))){
    for (j in seq_len(nrow(df2))){
      if (keep[j]){ # if decided to keep j
                    # in a previous loop
                    # it is not necessary to compare i
                    # with the other elements of df2
        next # if keep[j] is TRUE skip the rest of the loop
             # for this value of j
      } # if (keep[j])
      # keep[j] is FALSE
      eq_row <- TRUE
      for (k in 1:ncol(df1)){
        if (df1[i,k] != df2[j,k]){
          eq_row <- FALSE
          break
        }
      } #for (k in 1:ncol(df1))
      if (eq_row){
        keep[j] <- TRUE
      }
      if (keep[j]){ # optimization: if decided to keep j
                    # it is not necessary to compare i
                    # with the other elements of df2
        break
      } # if (keep[j])
    } # for (j in seq_len(nrow(df2)))
  }  # for (i in seq_len(nrow(df1)))
  u <- subset(df2, keep)
  rownames(u) <- seq_len(nrow(u)) # reset row numbers
  return(u)
}

######################
# union              #
######################
union <- function(df1, df2){
  u <- rbind(df1, df2)
  return(unique_el(u))
}

######################
# test program       #
######################
######################
# fn <- "emails3.csv"
# df <- read.csv(fn, header = TRUE, stringsAsFactors = FALSE)
# # colnames(df) <- "emails"
# cat("\"df\" is a data frame that can have duplicates\n")
# View(df)
# u <- unique_el(df)
# cat("\"u\" is a data frame without duplicates\n")
# View(u)

fn1 <- 'emails1.csv'
fn2 <- 'emails2.csv'
df1 <- read.csv(fn1, header = FALSE, stringsAsFactors = FALSE)
df2 <- read.csv(fn2, header = FALSE, stringsAsFactors = FALSE)
colnames(df1) <- "emails"
colnames(df2) <- "emails"
df1_nd <- unique_el(df1)
View(df1_nd)
df2_nd <- unique_el(df2)
View(df2_nd)

cat("\"i\" is a data frame intersection of df1 and df2\n")
i <- intersection(df1_nd,df2_nd)
View(i)
# 
# cat("\"u\" is a data frame union of df1 and df2\n")
# u <- union(df1, df2)
# View(u)
# 
# 
u <- union(df1_nd, df2_nd)
