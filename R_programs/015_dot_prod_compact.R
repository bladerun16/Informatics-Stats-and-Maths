u <-  c(12, 35, 47, 3)
v <-  c(32, 12, 52, 23)
if (length(v)!=length(u)){
  print("Lengths are different")
} else 
  if (length(u)==0){
    print(paste("The dot product is ",NA))
  } else {
    sum <- 0
    prod <- u*v   # product of vectors element by element
    for (i in seq_along(u)){ #scans all the positions of u
      sum <- sum + prod[i]
    }
    print(paste("The dot product is ",sum))
  }