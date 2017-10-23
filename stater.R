rm(list = ls())
states <- read.table(file = "states.txt",
                     header = TRUE,
                     sep = "\t",
                     comment.char = "#",
                     stringsAsFactors = FALSE)

name <- states$name
population <- states$population
income <- states$income
murder <- states$murder
hs_grad <- states$hs_grad
region <- states$region

#Select column hs_grad that has a value greater than 50 (%)
select_hs <- hs_grad > 50
gt_50 <- hs_grad[select_hs]

#Select column region that equal to South
select_reg <- region == "South"
reg_south <- region[select_reg]

#Select column region that equal to South or West
select_2reg <- region == "South" | region == "West"
reg_southwest <- region[select_2reg]

#Count the average of murder in the region South or West
ave_murder_sw <- mean(murder[select_2reg])

#Count the average of murder NOT in the region South or West
ave_murder_not_sw <- mean(murder[!select_2reg])

#Select column that locate in North Central region and
#the value of grad rates less than 60
select_nc <- region == "North Central" & hs_grad < 60
select_statenc <- name[select_nc]

#Ordering the select_statenc by increasing murderiness
statenc_by_murder <- murder[select_nc]
sorted_murder <- select_statenc[order(statenc_by_murder)]


print("Number of states with hs_grad above 50 (%):")
print(length(gt_50))
print("Number of states in South region:")
print(length(reg_south))
print("Number of states in the South or West region:")
print(length(reg_southwest))
print("Average murder rate of states in the South or West region:")
print(ave_murder_sw)
print("Average murder rate of states NOT in the South or West region:")
print(ave_murder_not_sw)
print("List of states in the North Central region w/ grad rates below 60:")
print(select_statenc)
print("North Central states w/ grad rates below 60, by increasing murderiness:")
print(sorted_murder)
