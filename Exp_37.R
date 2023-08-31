
library(caret)

data <- data.frame(
  Time = c(5, 10, 15, 20, 25),
  Diet = c(1, 2, 1, 2, 1),
  Weight = c(2.3, 2.8, 3.1, 3.6, 3.9)
)

X <- data[, c("Time", "Diet")]
y <- data$Weight

set.seed(123)
splitIndex <- createDataPartition(y, times = 1, p = 0.8, list = FALSE)
train_data <- data[splitIndex, ]
test_data <- data[-splitIndex, ]

model <- lm(Weight ~ Time + Diet, data = train_data)

new_data <- data.frame(Time = 10, Diet = 1)
prediction <- predict(model, newdata = new_data)
cat("Predicted weight:", prediction, "\n")

y_pred <- predict(model, newdata = test_data)
error <- mean((y_pred - test_data$Weight)^2)
cat("Mean Squared Error:", error, "\n")
