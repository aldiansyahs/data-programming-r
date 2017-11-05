rm(list = ls())

# function that return a calculation
# of the standard deviation divided by the mean
coeff_of_var <- function(val){
  (sd(val)/mean(val))
}

samp <- rnorm(100, mean = 10, sd = 2)
print(coeff_of_var(samp))

wages <- read.table("http://bit.ly/2xByQUX",
                    header = TRUE,
                    sep = '\t',
                    stringsAsFactors = FALSE)

# The code is counting coefficient of variance for each county
# then reorder the list which county has the highest of coefficient of variation

coef_county <- reorder(wages$entity_county, wages$total_wages, coeff_of_var)
print(coef_county)
