# https://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html
rm(list = ls())
# install.packages("rje")
require('rje')
# ############################################# #
# Knapsack, brute force, non optimized solution #
# ############################################# #
# Uses:
# - total value
# - total weight
# - best total value
# - total weight best
# - a data frame with the items, their weights and values
#
# Algorithm
# - generate the powerset of items (library function)
# - initialize the best total value to 0
# - repeat for each element s of the powerset
#   - initialize to zero total value and total weight
#   - repeat for each item in the current set s
#     - add weight and value of the item to
#       total weight and total value
#
knapsack_bf <- function(items, values, weights, weightLimit) {
  names(values) <- items
  names(weights) <- items
  bestTotalValue <- 0
  itemSet <- powerSet(items)
  for (s in itemSet) {
    totalValue <- 0
    totalWeight <- 0
    for (item in s) {
      totalValue <- totalValue + values[item]
      totalWeight <- totalWeight + weights[item]
      if (totalWeight >= weightLimit) {
        break
      } # total weight exceeded
    } # for item
    if ((totalWeight <= weightLimit) &&
        (totalValue > bestTotalValue)) {
      bestTotalValue <- totalValue
      bestItemSet <- s
      totalWeightBest <- totalWeight
    } # best has been updated
  } # for (s in itemSet)
  return(
    list(
      bestItemSet = bestItemSet,
      bestTotalValue = bestTotalValue,
      totalWeightBest = totalWeightBest
    )
  )
} # knapsack_bf: end

# items <- c('a','b','c','d', 'e')
# df <- data.frame(value = c(10,30, 40, 60, ),
#                  weight = c(10,20,30,40),
#                  row.names = items)
df <- read.csv("knapsack.csv", stringsAsFactors = FALSE)
row.names(df) <- df$item
#df$item <- NULL
weightLimit <- 165
res <- knapsack_bf(df$item, df$value, df$weight, weightLimit)
cat(
  "The best ItemSet is '",
  res$bestItemSet,
  "'\nIts value is ",
  res$bestTotalValue,
  "\nIts weight is ",
  res$totalWeightBest,
  "\nIts coverage is ",
  res$totalWeightBest / weightLimit * 100,
  "%\n",
  sep = ""
)
