rm(list = ls())
# test code for binSearch
# some alternative test codes can be obtained by commenting/uncommenting lines
# 
# setwd("~/Dropbox/Didattica/Informatics/0_slides/R-class")
source('binSearch.R')
#source('selectionSort.R')
#source('mergeSort.R')

phoneBook <- read.csv("phoneBook.csv"
                      , stringsAsFactors = F
#                      , quote = F
                      )
# the phoneBook.csv file is already sorted
#names <- mergeSort(readLines("lesson17_firstNames.txt"))
#names <- selectionSort(readLines("lesson17_firstNames.txt"))
target <- readline("Target? ")
#target <- sample(names, 1) # choose a random target
#r <- binSearch(names, target)
r <- binSearch(phoneBook$name,target)

if (r$found){
  cat(target, "Found in position ", r$position
      ," Phone number "            # comment line if not using phoneBook
      ,phoneBook$phone[r$position] # comment line if not using phoneBook
      ,"\n"
      )
} else {
  cat("Not found, can be inserted in position ",r$position, "\n")
}

# cat("Repetitions ", r$nRep, "\n")