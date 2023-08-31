
data("Titanic")

survival_by_class <- margin.table(Titanic, c(1, 4))

survival_by_class_df <- as.data.frame(survival_by_class)
colnames(survival_by_class_df) <- c("Class", "Survived", "Count")

library(ggplot2)
ggplot(survival_by_class_df, aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity") +
  labs(title = "Survival based on Passenger Class",
       x = "Class", y = "Count",
       fill = "Survived")r
survival_by_class_gender <- margin.table(Titanic, c(1, 2, 4))

survival_by_class_gender_df <- as.data.frame(survival_by_class_gender)
colnames(survival_by_class_gender_df) <- c("Class", "Gender", "Survived", "Count")

ggplot(survival_by_class_gender_df, aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Gender) +
  labs(title = "Survival based on Passenger Class and Gender",
       x = "Class", y = "Count",
       fill = "Survived")

library(dplyr)

titanic_age <- Titanic %>% filter(!is.na(Age))

ggplot(titanic_age, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Distribution of Age",
       x = "Age", y = "Count")


