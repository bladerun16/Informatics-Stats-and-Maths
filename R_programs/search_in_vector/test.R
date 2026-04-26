step = 2
size = 1000
prob_not_found = 0.1
rep = 10
search_fun <- linSearch
vec <- seq(1,size*step,step)
target <- sample(vec, 1) + sample(0:1, size = 1, prob = c(prob_not_found,1-prob_not_found))
elapsed_micro <- vector(mode = "numeric", length = rep)
result <- search_fun(vec, target)
