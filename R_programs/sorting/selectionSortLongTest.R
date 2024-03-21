rm(list = ls())
source("selectionSort.r")
# Suggestion: design an experiment which collects elapsed times for sorting
# vectors of varying sizes
# 
exp_cols = c('size','user_time')
experiment = data.frame(matrix(nrow=0,ncol=length(exp_cols)))
colnames(experiment) = exp_cols

nexp = 4 # number of experiments
for (i in 1:nexp+1){
  n <- 10^i
  v <- sample(1:n)
  experiment <- rbind(experiment,c(n,system.time(replicate(r,{selectionSort(v)}) )[1]))
}
experiment

plot(experiment, log="xy")
