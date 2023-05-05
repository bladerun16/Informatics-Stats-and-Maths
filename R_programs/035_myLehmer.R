# ############
# myLehmer
# ############
m <- 2^13-1 # modulus
a <- 234
z <- 345
# m <- 13
# a <- 6
# z <- 1
myLehmer <- function(){
  z <<- (a * z) %% m
  return(z)
} # myLehmer - end

r <- c()
for (i in 1:(m+1)){
  new <- myLehmer()
  if (new %in% r){
    print(paste("period length",i))
    break
  }
  r[length(r)+1] <- new
}
print(r)
