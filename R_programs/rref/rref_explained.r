row_swap <- function(m, i, j){
  if (i > nrow(m) | j > nrow(m)){
    return(NULL)
  }
  temp <- m[i,]
  m[i,] <- m[j,]
  m[j,] <- temp
  scale <<- -scale # update the global variable using <<-
  return(m)
} # row_swap: end

scalar_multiply <- function(m, i, alpha){
  if (i > nrow(m)){
    return(NULL)
  }
  m[i,] <- m[i,] * alpha
  scale <<- scale / alpha # update the global variable using <<-
  return(m)
} # scalar_multiply: end

row_combine <- function(m, i, j, alpha){
  if (i > nrow(m) | j > nrow(m)){
    return(NULL)
  }
  m[i,] <- m[i,] + m[j,] * alpha
  return(m)
} # row_combination: end

find_next_pivot <- function(m, start_row, start_col){
  norow <- nrow(m)
  nocol <- ncol(m)
  if (start_row > norow | start_col > nocol) {
    return(NULL)
  }
  for (pivot in start_col:nocol){
    for (r in start_row:norow){
      if (m[r,pivot] != 0){
        return(list(row=r, pivot=pivot))
      } # if (m[i,pivot] != 0)
    } #for (pivot in start_col:nocol)
  } # for (i in start_row:norow)
  return(NULL)
} # find_next_pivot: end

scale <- 1
m <- matrix(data = 
              c(0,20,0,40,20,0,60,0,0,30,0,0,60,-60,60,0
                ,0,0,60,90
                )
            , nrow = 5, byrow = TRUE
           )
print(m)

r <- 1              # current row
pivot <- 1          # look for next pivot starting from the first column
pivot_rc <- find_next_pivot(m, r, pivot) # returns row and column of next pivot
str(pivot_rc)

i <- pivot_rc$row
pivot <- pivot_rc$pivot  # update pivot column
if (i != r){ # row swap to put pivot in row r
    m <- row_swap(m, i, r)
}
print(m)
print(scale)

m <- scalar_multiply(m, r, 1/m[r, pivot])
print(m)
print(scale)

i <- 4 # besides the pivot, only row 4 is non-null in pivot column
m <- row_combine(m, i, r, -m[i, pivot])
print(m)

r <- r + 1
pivot <- pivot + 1
pivot_rc <- find_next_pivot(m, r, pivot) # returns row and column of next pivot
str(pivot_rc)

m <- scalar_multiply(m, r, 1/m[r, pivot])
print(m)
print(scale)

i <- 3 
m <- row_combine(m, i, r, -m[i, pivot])
i<- 4
m <- row_combine(m, i, r, -m[i, pivot])
print(m)

r <- r + 1
pivot <- pivot + 1
pivot_rc <- find_next_pivot(m, r, pivot) # returns row and column of next pivot
str(pivot_rc)

i <- pivot_rc$row
pivot <- pivot_rc$pivot  # update pivot column
if (i != r){ # row swap to put pivot in row r
    m <- row_swap(m, i, r)
}
print(m)
print(scale)

m <- scalar_multiply(m, r, 1/m[r, pivot])
print(m)
print(scale)

i <- 1 
m <- row_combine(m, i, r, -m[i, pivot])
i<- 5
m <- row_combine(m, i, r, -m[i, pivot])
print(m)
### Fourth execution of main loop: repeat step a)
# - increment current row and tentative pivot column
# - find next pivot
r <- r + 1
pivot <- pivot + 1
pivot_rc <- find_next_pivot(m, r, pivot) # returns row and column of next pivot
str(pivot_rc)

m <- scalar_multiply(m, r, 1/m[r, pivot])
print(m)
print(scale)

i <- 1 
m <- row_combine(m, i, r, -m[i, pivot])
i <- 2
m <- row_combine(m, i, r, -m[i, pivot])
i <- 3 
m <- row_combine(m, i, r, -m[i, pivot])
i <- 5
m <- row_combine(m, i, r, -m[i, pivot])

print(m)

print(scale)
