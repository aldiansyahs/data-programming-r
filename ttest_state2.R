rm(list = ls())
states <- read.table(file = "states.txt",
                     header = TRUE,
                     sep = "\t",
                     comment.char = "#",
                     stringsAsFactors = FALSE)



# given a data frame with columns for region and murder
# and two regions (length-one character vectors), runs a t-test
# on murder rates for those regions and returns just the pvalue.
# example: compare_murder_region(states, "West", "South")
# output: length-one numeric vector containing p-value
compare_murder_regions <- function(state,reg1,reg2){
  t.test (states$murder[states$region == reg1], states$murder[states$region == reg2])$p.value
}

res <- compare_murder_regions(states,"West","South")
print(res)

print(compare_murder_regions(states, "North Central", "South"))
