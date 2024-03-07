u <-  c(12, 35, 47, 3)
v <-  c(32, 12, 52, 23)
if (length(v)!=length(u)){
  print("Lengths are different")
} else 
  if (length(u)==0){
    print(paste("The dot product is ",NA))
  } else {
  sum <- 0
  for (i in seq_along(u)){ #scans all the positions of u
    sum <- sum + u[i]*v[i]
  }
  print(paste("The dot product is ",sum))
}