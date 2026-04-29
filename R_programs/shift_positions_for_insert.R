x <- c("b","e","h","m","t")
t <- "g"
p <- 3

# repeat for all the positions i from the last to p
#   copy the content of i position to position i + 1
# copy t to position p 
for (i in length(x):p){
  x[i+1] <- x[i]
}
x[p] <- t
x
