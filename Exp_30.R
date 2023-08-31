
library(caret)


data(iris)

iris_subset <- iris[, c("Species", "Petal.Width", "Petal.Length")]

set.seed(123)

train_index <- createDataPartition(iris_subset$Species, p = 0.8, list = FALSE)
train_data <- iris_subset[train_index, ]
test_data <- iris_subset[-train_index, ]

log_reg_model <- glm(Species ~ Petal.Width + Petal.Length, data = train_data, family = "binomial")

test_probabilities <- predict(log_reg_model, newdata = test_data, type = "response")

predicted_classes <- ifelse(test_probabilities > 0.5, "virginica", "setosa")
confusion_matrix <- table(Actual = test_data$Species, Predicted = predicted_classes)

print(confusion_matrix)
