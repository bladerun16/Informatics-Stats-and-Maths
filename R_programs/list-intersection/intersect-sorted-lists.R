# intersect_sorted_lists_loop.R
# Assumes each input file contains one element per line
# Use
#   list1, list2 : lists of values
#   intersection : list in output
#   s: pointer to last element of intersection
#   i, j : pointers to elements of list1 and list2 under consideration
# Algorithm
# input of list1 and list2
# prepare an empty variable intersection
# set s to 0
# repeat varying i from 1 to the length of list1
#   repeat varying j from 1 to the length of list2
#     if element in position i of list1 is equal to element in position j of list2
#       increment s by 1
#       store the element in position i of list1 into position s of intersection
# output intersection
rm(list = ls()) # clear the workspace
# filenames for input and output
file1 <- "list1_sorted.txt"
file2 <- "list2_sorted.txt"
outfile <- "intersection.txt"

# Read lists: one element per line.
list1 <- readLines(file1)
list2 <- readLines(file2)

# Implement the pseudocode: nested loops, append every time elements are equal.
intersection <- character(0) # create the empty vector for the intersection
s <- 0L # the pointer is integer
i <- 1L
j <- 1L

while (i <= length(list1) & j <= length(list2)) {
  if (list1[i] == list2[j])  {
    s <- s + 1L
    intersection[s] <- list1[i]
    i <- i + 1L
    j <- j + 1L
  } else {
    if (list1[i] < list2[j]) {
      i <- i + 1L
    } else {
      j <- j + 1L
    }
  }
}

# Output results
if (length(intersection) == 0) { # no match found
  message("No matches found. Writing empty file: ", outfile)
  writeLines(character(0), con = outfile)
} else { # match(es) found
  message("Found ",
          length(intersection),
          " match(es). Writing to: ",
          outfile)
  writeLines(intersection, con = outfile) # save to file
}

# Also print to stdout
cat("Intersection (in order found):\n")
if (length(intersection) == 0) {
  cat("(none)\n")
} else {
  cat(paste0(intersection, collapse = "\n"), "\n")
}