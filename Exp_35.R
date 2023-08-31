
library(reshape2)
library(dplyr)

data("ChickWeight")

ordered_data <- ChickWeight %>% arrange(diet, weight) %>% group_by(diet) %>% slice_tail(n = 6)
print(ordered_data)

melted_data <- melt(ChickWeight, id.vars = c("Chick", "Time", "Diet"))
print(melted_data)

casted_mean <- dcast(melted_data, Diet ~ variable, mean)
print(casted_mean)

casted_mode <- dcast(melted_data, Diet ~ variable, function(x) { which.max(table(x)) })
print(casted_mode)
