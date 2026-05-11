# Bernoulli Experiment Simulation
#
# Algorithm:
# 1. Choose the number of repeated trials n.
# 2. Choose the probability p of success in each trial.
# 3. For each trial:
#    - Generate a random number u between 0 and 1.
#    - If u <= p, record success as 1.
#    - Otherwise, record failure as 0.
# 4. Store all results in a vector.
# 5. Count the number of successes and failures.
# 6. Compute the observed relative frequency of success.
#
# Parameters:
#   n : number of Bernoulli trials
#   p : probability of success in each trial
#
# Local variables:
#   results   : vector storing the simulated binary outcomes
#   u         : random number generated at each trial
#   successes : number of observed successes
#   failures  : number of observed failures
#   rel_freq  : observed relative frequency of success
#
# Output:
#   A list containing:
#     - simulated binary values
#     - number of successes
#     - number of failures
#     - observed relative frequency of success
############################################################
rm(list = ls())
simulate_bernoulli <- function(n, p) {
  
  # Check that n is a positive integer
  if (n <= 0 || n != floor(n)) {
    stop("n must be a positive integer.")
  }
  
  # Check that p is a valid probability
  if (p < 0 || p > 1) {
    stop("p must be between 0 and 1.")
  }
  
  # Create an empty vector to store the binary outcomes
  results <- numeric(n)
  
  # Simulate n Bernoulli trials
  for (i in 1:n) {
    
    # Generate a random number from the Uniform(0,1) distribution
    u <- runif(1)
    
    # Assign 1 if the random number is less than or equal to p
    if (u <= p) {
      results[i] <- 1
    } else {
      results[i] <- 0
    }
  } # for
  
  # Count the number of successes
  successes <- sum(results)
  
  # Count the number of failures
  failures <- n - successes
  
  # Compute the observed relative frequency of success
  rel_freq <- successes / n
  
  # Return the results
  return(list(
    values = results,
    successes = successes,
    failures = failures,
    relative_frequency = rel_freq
  ))
}

bernoulli_num_succ <- function(n, p) {
  
  # Check that n is a positive integer
  if (n <= 0 || n != floor(n)) {
    stop("n must be a positive integer.")
  }
  
  # Check that p is a valid probability
  if (p < 0 || p > 1) {
    stop("p must be between 0 and 1.")
  }
  
  # Create an empty vector to store the binary outcomes
  # Count the number of successes
  successes <- sum(runif(n)<=p)
  
  # Return the results
  return(successes)
}

# write a function that executes rep times bernoulli_num_succ
# and records the distribution of the outcomes
# Parameters: n, p
# Output: a dataframe with two columns: 
#   - successes   : the possible numbers of successes
#   - frequency  : the frequency of each number of successes
# a vector of size n+1 that for each element i counts the number of 
#         times that the function produced i-1 true
# Use:
#   dist_values : vector of counts, size n+1
bernoulli_dist <- function(repetitions, n, p){
  # Check that n is a positive integer
  if (n <= 0 || n != floor(n)) {
    stop("n must be a positive integer.")
  }
  
  # Check that p is a valid probability
  if (p < 0 || p > 1) {
    stop("p must be between 0 and 1.")
  }
  dist_values <- data.frame(successes = 0:n, frequency = rep(0, n+1))
  for (i in 1:repetitions){
    # why is the solution below wrong?
    dist_values$frequency[bernoulli_num_succ(n,p)+1] <- 
      dist_values$frequency[bernoulli_num_succ(n,p)+1] +1
    # index <- bernoulli_num_succ(n,p)+1
    # dist_values$frequency[index] <- 
    #   dist_values$frequency[index] +1
  } # for
  cat("\n")
  dist_values$frequency <- dist_values$frequency/repetitions
  return(dist_values)
} # bernoulli_dist - end

############################################################
# Example usage
############################################################

# experiment <- simulate_bernoulli(n = 20, p = 0.5)

# bernoulli_num_succ(10,0.5)

result <- bernoulli_dist(10,10,0.5)

# Load ggplot2
library(ggplot2)

# Plot frequencies for each integer number of successes
ggplot(result, aes(x = factor(successes), y = frequency)) +
  geom_col() +
  labs(
    title = "Histogram of Successes",
    x = "Number of Successes",
    y = "Frequency"
  )
