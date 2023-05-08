rm(list=ls())
m <- as.matrix(
  read.table("example042_apply_data.txt"
             , header = F))
# for-loop 
res_for=numeric()
for(i in 1:nrow(m)){
  res_for=c(res_for,mean(m[i,]))
}
# apply 
res_apply <- apply(m,1,mean)

res_apply2 <- apply(m,2,mean)

# lapply
res_lapply <- 
  unlist(lapply(1:nrow(m)
                ,function(i) mean(m[i,])))
# sapply
res_sapply <- 
  sapply(1:nrow(m)
         , function(i) mean(m[i,]))


conditional <- function(x){
  if (abs(x)<=1){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

v <- c(2,1,-1,-4)

apply(v, 1, conditional)
