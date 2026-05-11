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
  }
  
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

############################################################
# Example usage
############################################################

experiment <- simulate_bernoulli(n = 20, p = 0.5)

experiment
