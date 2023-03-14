rm(list = ls())
# set functions test
source("set_check.R")
source("set_equal.R")
source("set_intersect.R")
source("set_setdiff.R")
source("set_subset.R")
source("set_union.R")
source("set_unique.R")

v1 <- 1:2
v2 <- 0:4
cat(v1,"subset",v2,set_subset(v1,v2),"\n")
#
v1 <- 0:4
v2 <- 1:2
cat(v1,"subset",v2,set_subset(v1,v2),"\n")
#
v1 <- 0:4
v2 <- 0:4
cat(v1,"subset",v2,set_subset(v1,v2),"\n")
#
v1 <- sample(10,5)
v2 <- sample(10,5)
cat("v1 =",sort(v1),"\n")
cat("v2 =",sort(v2),"\n")
#
v <- set_union(v1,v2)
cat("v1 union v2=",sort(v),"\n")
#
v <- set_intersect(v1,v2)
cat("v1 intersection v2=",sort(v),"\n")
#
v <- sample(5,20,replace = T)
cat("v =",v,"\n")
cat("unique v=",sort(set_unique(v)),"\n")
#
v <- set_setdiff(v1,v2)
cat("v1 minus v2=",set_setdiff(v1,v2),"\n")

###########
# comparison with standard functions
n <- 100000
f <- 0.1
set.seed(42)
universe <- runif(n)
i1 <- sample.int(n, f*n)
i2 <- sample.int(n,f*n)
v1 <- universe[i1]
v2 <- universe[i2]
t_union_s <- system.time(u <- union(v1,v2))
t_union_v <- system.time(u <- set_union(v1,v2))
print(t_union_s)
print(t_union_v)
