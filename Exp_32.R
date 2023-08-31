
data(airquality)

head(airquality)

summary(airquality)

cor_matrix <- cor(airquality[, c("Ozone", "Solar.R", "Wind", "Temp")])
print(cor_matrix)

par(mfrow = c(2, 2))
hist(airquality$Ozone, main = "Ozone")
hist(airquality$Solar.R, main = "Solar Radiation")
hist(airquality$Wind, main = "Wind Speed")
hist(airquality$Temp, main = "Temperature")
par(mfrow = c(1, 1))

pairs(airquality[, c("Ozone", "Solar.R", "Wind", "Temp")], main = "Scatter Plot Matrix")

boxplot(Ozone ~ Month, data = airquality, main = "Ozone Levels by Month")

plot(airquality$Day, airquality$Ozone, type = "l", xlab = "Day", ylab = "Ozone",
     main = "Ozone Levels Over Days")
