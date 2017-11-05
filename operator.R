rm(list = ls())

# reading a txt file
# store it in variabel called 'expr' as a table
expr <- read.table("expr_long_coded_clean.txt",
                                header = TRUE,
                                sep = "\t",
                                stringsAsFactors = FALSE
                                )

# storing ID's with a condition
# if the expression greater than the median of all expression
keep_ids <- expr$id[expr$expression > median(expr$expression)]

# storing a table of expr that has a logical condition rule
# it's attempting to match row names with
# %in% comparison that does match everything in 'keep_ids' also it is in 'expr$id'
# regardless the number of elements in 'keep_ids' as long as the element is in 'expr$id'
expr1 <- expr[expr$id %in% keep_ids, ]

# storing a table of expr that has a logical condition rule
# it's attempting to match row names with
# == comparison that does match elements in 'keep_ids' and 'expr$id'
# it would simply check the first time the element in 'expr$id' as same as the element in 'expr$id'
expr2 <- expr[expr$id == keep_ids, ]

# storing a table of expr that has a logical condition rule
# it's attempting to match row names with 'keep_ids'
# however, there is now match founded so it mostly returns a lot of NAs
expr3 <- expr[keep_ids, ]

# return subsets data frames of 'expr' which meet conditions of
# every value in column ID and also give a sign if the value in column ID also
# available in the condition of keep_ids
# returns a logical vector indicating if there is a match or not for its left operand
expr4 <- subset(expr, id %in% keep_ids)

# return subsets data frames of 'expr' which meet conditions
# the condition which is the value in column ID equal the value of keep_ids
expr5 <- subset(expr, id == keep_ids)

# give an error
# because in subset function, second argument must be logical
expr6 <- subset(expr, keep_ids)
