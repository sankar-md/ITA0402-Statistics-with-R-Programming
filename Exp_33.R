
library(reshape2)

data("airquality")

summary_stats <- summary(airquality)
print(summary_stats)

melted_data_long <- melt(airquality)
print(melted_data_long)

melted_data_id <- melt(airquality, id.vars = c("Month", "Day"))
print(melted_data_id)

casted_data <- dcast(melted_data_id, Month + Day ~ variable)
print(casted_data)

average_per_month <- dcast(melted_data_id, Month ~ variable, mean)
print(average_per_month)
