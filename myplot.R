rm(list = ls())

# assign function rnorm to variable
samp <- rnorm(100, mean = 30, sd = 2)

# showing points in histogram
hist(samp)
dev.off()
