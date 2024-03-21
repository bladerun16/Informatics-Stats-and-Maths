rm(list = ls())
gdp2014 <- 
  read.csv("gdp2014.csv",
           sep = ";")
colnames(gdp2014)
nrow(gdp2014)
length(gdp2014)
ncol(gdp2014)
str(gdp2014)
tail(gdp2014)
summary(gdp2014)
# View(gdp2014)
gdp2014 <- 
  read.csv("gdp2014_nh.csv",
           sep = ";",
           header = FALSE
           )

# add a new column with relative values of gdp
# and store it to a new file
# 
# - ### compute gdp_tot the sum of the gdp column
# - gdp_tot <- 0
#   - repeat along gdp_millions_usd
#     - add the value to gdp_tot
# - divide each gdp by gdp_tot and store it in a vector
# - add the vector to gdp
# 

gdp_tot <- 0
for (i in seq_along(gdp2014$gdp_millions_usd)){
  gdp_tot <- gdp_tot + gdp2014$gdp_millions_usd[i]
}
rel_gdp <- vector(mode = "double", length = nrow(gdp2014))
for (i in seq_along(gdp2014$gdp_millions_usd)){
  rel_gdp[i] <- gdp2014$gdp_millions_usd[i]/gdp_tot
}
gdp2014_wr <- cbind(gdp2014,rel_gdp)
write.csv(gdp2014_wr, 
          "gdp2014_wr.csv",
          row.names = FALSE)

rel_gdp <- gdp2014$gdp_millions_usd / sum(gdp2014$gdp_millions_usd)
gdp2014_rd <- gdp2014[,c("country_code","ranking","gdp_millions_usd")]
                      
gdp2014$economy <- NULL
head(gdp2014)

# generate a new dataframe with rows having
# a relative gdp more than 5%
