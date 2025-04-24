# example with a matrix
# Create a matrix with n rows and ncol columns
n <- 1000 # number of rows
ncol = 4
my_matrix <- matrix(sample(n), ncol = ncol)
print("Original Matrix:")
print(my_matrix)

# Calculate row sums using apply (MARGIN = 1 means rows)
row_sums <- apply(my_matrix, 1, sum)
print("Row Sums:")
print(row_sums)

# Calculate column sums using apply (MARGIN = 2 means columns)
col_sums <- apply(my_matrix, 2, sum)
print("Column Sums:")
print(col_sums)


# ####################################
# Example with a dataframe
# Load the built-in mtcars dataset
data(mtcars)

# Preview the first few rows
print(head(mtcars))

# Use apply to compute the mean of each column
column_means <- apply(mtcars, 2, mean)

# Print the result
print("Mean of each column:")
print(column_means)
