# Apply Family in R: Use Cases and Examples
# The apply family helps avoid explicit loops by applying a function
# across vectors, lists, matrices, arrays, or data frames.

# ------------------------------------------------------------
# 1. apply()
# ------------------------------------------------------------
# Use case: Apply a function over rows or columns of a matrix/data frame.
# Best for: matrices and array-like objects.

m <- matrix(1:12, nrow = 3, byrow = TRUE)
m

# Row-wise sums
apply(m, MARGIN = 1, FUN = sum)

# Column-wise means
apply(m, MARGIN = 2, FUN = mean)

# Row-wise maximum
apply(m, 1, max)

# Column-wise standard deviation
apply(m, 2, sd)


# ------------------------------------------------------------
# Use case: Row-wise calculations on numeric data
# ------------------------------------------------------------

student_scores <- data.frame(
  maths = c(80, 65, 90),
  science = c(75, 70, 95),
  english = c(85, 60, 88)
)

student_scores

# Average score per student
apply(student_scores, 1, mean)

# Highest score per subject
apply(student_scores, 2, max)


# ------------------------------------------------------------
# 2. lapply()
# ------------------------------------------------------------
# Use case: Apply a function to each element of a list.
# Always returns a list.
# Best for: lists and data frames when list output is acceptable.

numbers <- list(
  a = 1:5,
  b = 10:15,
  c = c(100, 200, 300)
)

# Mean of each list element
lapply(numbers, mean)

# Length of each list element
lapply(numbers, length)

# Square each list element
lapply(numbers, function(x) x^2)


# ------------------------------------------------------------
# Use case: Apply a function to each column of a data frame
# ------------------------------------------------------------

df <- data.frame(
  age = c(21, 25, 30, 40),
  income = c(30000, 45000, 70000, 90000),
  score = c(70, 85, 90, 95)
)

# Mean of each column
lapply(df, mean)

# Class of each column
lapply(df, class)


# ------------------------------------------------------------
# 3. sapply()
# ------------------------------------------------------------
# Use case: Same as lapply(), but tries to simplify the result.
# It may return a vector, matrix, or list.
# Best for: quick interactive work.

sapply(numbers, mean)

sapply(numbers, length)

sapply(df, mean)

# Compare:
lapply(df, mean)   # returns list
sapply(df, mean)   # returns named numeric vector


# ------------------------------------------------------------
# 4. vapply()
# ------------------------------------------------------------
# Use case: Safer version of sapply().
# You specify the expected output type.
# Best for: production-quality code.

vapply(numbers, mean, numeric(1))

vapply(numbers, length, integer(1))

vapply(df, mean, numeric(1))

# This gives more predictable output than sapply().


# ------------------------------------------------------------
# 5. tapply()
# ------------------------------------------------------------
# Use case: Apply a function to groups of values.
# Best for: grouped summaries.

scores <- c(80, 75, 90, 60, 85, 70)
class_group <- c("A", "A", "B", "B", "C", "C")

# Mean score by group
tapply(scores, class_group, mean)

# Maximum score by group
tapply(scores, class_group, max)


# ------------------------------------------------------------
# Use case: Grouped summary with multiple categories
# ------------------------------------------------------------

sales <- c(100, 200, 150, 300, 250, 400)
region <- c("North", "North", "South", "South", "North", "South")
product <- c("A", "B", "A", "B", "A", "B")

# Total sales by region
tapply(sales, region, sum)

# Total sales by region and product
tapply(sales, list(region, product), sum)


# ------------------------------------------------------------
# 6. mapply()
# ------------------------------------------------------------
# Use case: Apply a function to multiple inputs in parallel.
# Best for: element-wise operations across multiple vectors/lists.

x <- c(1, 2, 3)
y <- c(10, 20, 30)

mapply(sum, x, y)

mapply(function(a, b) a * b, x, y)

# Example: repeat values different numbers of times
mapply(rep, x = c("A", "B", "C"), times = c(2, 3, 4))


# ------------------------------------------------------------
# Use case: Build strings from multiple vectors
# ------------------------------------------------------------

first_name <- c("Alice", "Bob", "Charlie")
score <- c(85, 72, 91)

mapply(
  function(name, mark) paste(name, "scored", mark),
  first_name,
  score
)


# ------------------------------------------------------------
# 7. rapply()
# ------------------------------------------------------------
# Use case: Recursively apply a function to nested lists.
# Best for: deeply nested list structures.

nested <- list(
  a = 1:3,
  b = list(
    c = 4:6,
    d = list(e = 7:9)
  )
)

# Apply sum recursively
rapply(nested, sum)

# Apply mean recursively
rapply(nested, mean)

# Return as a list
rapply(nested, mean, how = "list")


# ------------------------------------------------------------
# 8. eapply()
# ------------------------------------------------------------
# Use case: Apply a function to all objects in an environment.
# Best for: advanced use, such as inspecting environments.

env <- new.env()

env$x <- 1:5
env$y <- c(10, 20, 30)
env$name <- "example"

# Get class of every object in the environment
eapply(env, class)

# Get length of every object
eapply(env, length)


# ------------------------------------------------------------
# 9. by()
# ------------------------------------------------------------
# Use case: Apply a function to a data frame split by factor(s).
# Best for: grouped analysis on data frames.

iris_small <- iris[sample.int(nrow(iris), size = 20), ]

by(
  iris_small$Sepal.Length,
  iris_small$Species,
  mean
)

by(
  iris,
  iris$Species,
  function(sub_data) colMeans(sub_data[1:4])
)


# ------------------------------------------------------------
# 10. aggregate()
# ------------------------------------------------------------
# Use case: Grouped summaries for data frames.
# Best for: readable grouped summaries.

aggregate(
  Sepal.Length ~ Species,
  data = iris,
  FUN = mean
)

aggregate(
  cbind(Sepal.Length, Sepal.Width) ~ Species,
  data = iris,
  FUN = mean
)


# ------------------------------------------------------------
# 11. replicate()
# ------------------------------------------------------------
# Use case: Repeat an expression many times.
# Best for: simulations and resampling.

# Roll one die 10 times
replicate(10, sample(1:6, size = 1))

# Simulate mean of 5 dice rolls, repeated 100 times
simulated_means <- replicate(100, mean(sample(1:6, size = 5, replace = TRUE)))

summary(simulated_means)


# ------------------------------------------------------------
# Practical comparison
# ------------------------------------------------------------

data <- data.frame(
  group = c("A", "A", "B", "B", "C", "C"),
  value1 = c(10, 20, 30, 40, 50, 60),
  value2 = c(5, 15, 25, 35, 45, 55)
)

# Column means
sapply(data[ , c("value1", "value2")], mean)

# Row sums
apply(data[ , c("value1", "value2")], 1, sum)

# Grouped mean
tapply(data$value1, data$group, mean)

# Data-frame grouped mean
aggregate(value1 ~ group, data = data, FUN = mean)


# ------------------------------------------------------------
# Which apply function should you use?
# ------------------------------------------------------------

# apply()     : rows/columns of matrices or data frames
# lapply()    : each element of a list; always returns a list
# sapply()    : like lapply(), but simplifies the result
# vapply()    : safer sapply(); specify expected output type
# tapply()    : grouped summaries for vectors
# mapply()    : apply function over multiple inputs in parallel
# rapply()    : recursively process nested lists
# eapply()    : apply function over objects in an environment
# by()        : grouped operations on data frames
# aggregate() : readable grouped summaries
# replicate() : repeated simulation or repeated expression evaluation


# ------------------------------------------------------------
# Rule of thumb:
# ------------------------------------------------------------

# Use lapply() when working with lists.
# Use apply() for rows/columns of a matrix.
# Use tapply() or aggregate() for grouped summaries.
# Use mapply() when the function needs multiple arguments.
# Use vapply() instead of sapply() when reliability matters.