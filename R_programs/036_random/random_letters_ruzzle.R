rm(list = ls())
#setwd("~/Dropbox/Didattica/Informatics/0_R/R-class")
#setwd("M:/Sartori/Informatics-R-class")


ruzzle <- sample(letters,16,replace = T)
ruzzle <- matrix(ruzzle, nrow = 4)
# each letter has the same probability
print(ruzzle)

# read the file of letter probabilities
# check that the double have . and not ,
letter_freq <- read.csv(  "letter_freq.csv"
                        , header = FALSE
                        , sep = ";")
normalize <- sum(letter_freq$V2)
freq <- letter_freq$V2 / normalize
ruzzle <- matrix(  sample(  letter_freq$V1
                , 16
                , replace = TRUE
                , prob = freq
                )
       , nrow = 4)

# 
print(ruzzle)
