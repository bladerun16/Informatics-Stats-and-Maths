# Set the size of the matrix
n <- 5  # Change this to any size you want

# Generate the random 0/1 matrix
random_matrix <- matrix(sample(c(0, 1), n * n, replace = TRUE), nrow = n, ncol = n)

# Print the matrix
print(random_matrix)
