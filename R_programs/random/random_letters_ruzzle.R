rm(list = ls())
# first trial: naive solution
ruzzle <- sample(LETTERS,16,replace = T)
print(ruzzle)
# rearrange into a square
ruzzle <- matrix(ruzzle, nrow = 4)
# each letter has the same probability
print(ruzzle)

# Generate a Ruzzle schema for the 
# english language
# - download the file of the letter frequencies
#   for the appropriate language
# - inspect visually the file and see if we
#   need to set the separator and the header, 
#   if necessary reload the file into dataframe 
#   let_prob, names (Letter, Prob)
# - generate a matrix with the appropriate size
#   using "sample" with parameters 
#   - x=Letter, 
#   - size = desired size
#   - replace = True,
#   - prob=Prob
#   

letter_freq <- read.csv(  "letter_freq.csv"
                        , header = FALSE
                        , sep = ";")
names(letter_freq) <- c("Letter", "Freq")
letter_freq$Freq <- letter_freq$Freq / sum(letter_freq$Freq)
ruzzle <- matrix(  sample(  letter_freq$Letter
                , 16
                , replace = TRUE
                , prob = letter_freq$Freq
                )
       , nrow = 4)

# 
print(ruzzle)
