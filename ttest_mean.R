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
compare_murder_regions <- function(state,region1, region2){
  t.test (states$murder[states$region == region1], states$murder[states$region == region2])
}

# This is the second function or murder rates in specific region
# It calls the first function to specify some values that needed
compare_murder_regions2 <- function(state,regions_1,regions_2){
  pval <- compare_murder_regions(state, regions_1, regions_2)$p.value
  mean_region1 <- compare_murder_regions(state, regions_1, regions_2)$estimate[[1]]
  mean_region2 <- compare_murder_regions(state, regions_1, regions_2)$estimate[[2]]
  est_list <- list(pval,mean_region1,mean_region2)
  value <- data.frame(pval,mean_region1,mean_region2, stringsAsFactors = FALSE)
}

res <- compare_murder_regions2(states, "West", "South")
print(res)

print (compare_murder_regions2(states, "North Central", "South"))
