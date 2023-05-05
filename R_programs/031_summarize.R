# ######################################################
# summarize
#
# Given a data frame with n observations
# For each observation several fields, among them a class key, 
# with nKeys possible different values
# generate a new file with nKeys rows
#   key - class label
#   count - absolute frequencies of the nKeys different values 
#           in the n observations

# External: uses a function for key search in st
#
# Parameters:
# df - the input data frame
# sc - the summarization column, for which we will produce  
#      the distinct values and the counts
#
# Uses:
# st - data frame for the summary table
# nKeys - number of distinct class keys
#
# Algo:
# - if df is empty returns null
# - initialize st with first key in df and count 1
# - initialize the number of distinct keys to 1
# - if length of df is 1 returns st
# - repeat varying i from 2 to the length of df
#   - binary search of current key in st
#   - if found increment count in position found
#     else if insertion position is inside st
#             - shift by 1 the positions in st 
#               from insertion position to the end
#          - insert a row with the current key in df 
#            and the count=1
#          - increment by 1 the number of keys
# - return st
source("binSearch.R")
summarize <- function(v){
  # special case exit
  if (length(v) == 0) 
    return(NULL)
  # initialize the summary table st
  st <- data.frame(list(key = v[1], count = 1)
                   , stringsAsFactors = F)
  nKeys <- 1
  # second special case exit
  if (length(v) == 1)
    return(st)
  # loop on input rows
  for (i in 2:length(v)){
    # search the current key in st
    result <- binSearch(st$key,v[i])
    if (result$found) # key already in table: 
      #   increment count
      st$count[result$position] <- st$count[result$position] + 1
    else { # key not yet in table: must insert
      if (result$position < nKeys+1)
        # insertion in the middle: 
        #    needs to prepare the space
        st[(result$position+1):(nKeys+1),] <- 
          st[result$position:nKeys,]
      # now the new row can be inserted in result$position
      st[result$position,] <- list(key = v[i], count = 1)
      nKeys <- nKeys + 1
    } # end else: if (result$found)
  } # end: for (i in 2:length(df[,sc]))
  return(st)
}