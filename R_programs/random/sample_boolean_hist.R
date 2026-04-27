rm(list = ls())
###############
# common parameters
n <- 100 # number of trials
p <- 0.05 # probability of true
pow <- 6
nTests <- 10^pow 
outcome <- vector(mode = "numeric", length = nTests)
# Internal repetition: repeating the random experiment
for (i in 1:nTests){
  # "local" experiment to be repeated
  # set.seed(38) # what happens if we put 
  # set.seed(<any number>) here?
  v1 <- sample(x = c(T,F), size = n, 
               replace = T, prob = c(p, 1-p))
  outcome[i] <- sum(v1)
} # for (i in 1:nTests)
histTitle = paste("n =", n, "- p =", p, " - repetitions =", nTests, "\n",
                "sum(sample(x = c(T,F), size = n, replace = T, prob = c(p, 1-p)))")
hist(outcome
     , main = histTitle
     , xlab = "Outcome"
)
outcomeDf <- as.data.frame(table(outcome))
aroundFactor <- .2
aroundMin <- n*p*(1-aroundFactor)
aroundMax <- n*p*(1+aroundFactor)
sum(outcomeDf$Freq[aroundMin <= as.integer(outcomeDf$outcome) & 
                     as.integer(outcomeDf$outcome) <= aroundMax])
###############
