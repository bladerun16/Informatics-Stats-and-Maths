u <-  c(12, 35, 47, 3)
v <-  c(32, 12, 52, 23)
if (length(v)!=length(u)){
  print("Lengths are different")
} else 
  if (length(u)==0){
    print(paste("The dot product is ",NA))
  } else {
    dot <- sum(u*v)   # product of vectors element by element
    print(paste("The dot product is ",sum))
  }