# Example of plot with scale type
# Binary experiment with probability of success p
# Show the convergence to p for increasing number of trials
set.seed(2442)
p=0.5
n_trial_range <- as.integer(10^(2:12*0.5))
success <- vector(mode="numeric")
for (n in n_trial_range){
  success[length(success)+1] = 
    sum(sample(x=c(T,F), size=n
                       , replace=T
                       , prob = c(p,1-p)
                       )
                ) / n
}
success
plot(n_trial_range,success, log = "x", type = "b"
     , xlab = "Number of trials"
     , ylab = "Fraction of successes"
     , ylim = c(0.4,0.6)
     , main= paste0("Binary experiment","\n"
     , "Convergence of fraction of successes for increasing trials"))
abline(a=p,b=0)
text(paste("p =",p),x=30,y=p*1.01)
