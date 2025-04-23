rm(list = ls())
# test code for binSearch
# some alternative test codes can be obtained by commenting/uncommenting lines
# 
source('binSearch.R')
#source('selectionSort.R')
#source('mergeSort.R')

vocabulary <- readLines("words_alpha.txt")
# the words_alpha.txt file is already sorted
#names <- mergeSort(readLines("lesson17_firstNames.txt"))
#names <- selectionSort(readLines("lesson17_firstNames.txt"))
repeat {
  target <- readline("Target? (hit Return to end) ")
  if (target =="")
    break
  r <- binSearch(vocabulary,target)
  cat(target)
  if (r$found){
    cat(" found\n"
    )
  } else {
    cat(" not found\n")
  }
} # repeat - end
