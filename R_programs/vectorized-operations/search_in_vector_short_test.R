##################### #
# test program        #
# for search_in_vector#
# ################### #
# the functions are defined in another file
m <- 100
n <- 30
# prepare a vector with a random repetitions of m targets
v <- sample.int(m, size = n, replace = T) # prepare vector
target <- sample.int(m, size = 1) # prepare target

cat("Compare searching times of target in a vector with ", 
    format(as.integer(n), digits = 11), " elements\n")
cat("Search time with for loop   ",
    system.time(f <- search_in_vector_for(v, target))[1],# [1] selects user time
    "\n")
cat("Search time with while loop ",
    system.time(f <- search_in_vector_while(v, target))[1],# [1] selects user time
    "\n")
cat("Search time vectorised      ",
    system.time(f <- search_in_vector_vec(v, target))[1],
    "\n")
