# ############
# the Lehmer random number generator
# ############
m <- as.integer(2^19-1) # modulus
a <- 345L    # multiplicator
seed <- 345L # just a value for the seed
# m <- 13L
# a <- 6L
# z <- 1L
# 
# check validity of a and m
if (a * m > .Machine$integer.max | seed >= m){
  stop("Bad parameter a, m or seed")
}
# ###################
# Initialization
z <- seed
# ###################
# mimics the standard set.seed() function 
mySetSeed <- function(seed){
  z <<- as.integer(seed)
}

# ####################
# myLehmer           #
# ################## #
# Simple implementation
# works only if a * m <= .Machine$integer.max
# otherwise it gives an integer overflow
# ################## #
myLehmer <- function(){
  z <<- (a * z) %% m
  return(z)
} # myLehmer - end

# look for the best multiplier
max_a = as.integer(.Machine$integer.max/m)
max_p <- 1
best_a <- 2
# for (a in 3:max_a){
for (a in max_a:3){
  for (i in 1:(m+1)){
    new <- myLehmer()
    # if (new %in% r){
    if (new == seed){
      # print(paste("period length",i))
      break
    }
  }
  if (i > max_p){
    max_p=i
    best_a=a
    print(paste("period:",max_p," - Multiplier:",best_a))
  }
  if (a%%100==0){
    print(a)
  }
}

