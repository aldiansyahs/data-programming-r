rm(list = ls())

# reading text file
states <- read.table(file = "states.txt",
                     header = TRUE,
                     sep = "\t",
                     comment.char = "#",
                     stringsAsFactors = FALSE)
                     
# assign columns into variable
name <- states$name
population <- states$population
income <- states$income
murder <- states$murder
hs_grad <- states$hs_grad
region <- states$region

# a function
# return a result p_value of t.test function
t_test_pvalue <- function(a,b){
  t.test(a,b)$p.value
}

# assign all value of murder in West region
west_murders <- murder[region == "West"]
# assign all value of murder in South region
south_murders <- murder[region == "South"]
# call the function and print the result
print(t_test_pvalue(west_murders,south_murders))
