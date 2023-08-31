
library(readr)
library(dplyr)
library(ggplot2)

url <- "https://raw.githubusercontent.com/datasciencedojo/datasets/master/USArrests.csv"
data <- read_csv(url)

cat("Number of features:", ncol(data), "\n")
cat("Number of records:", nrow(data), "\n")

summary(data)

state_with_largest_rape <- data %>%
  filter(Rape == max(Rape)) %>%
  select(State) %>%
  pull()
cat("State with largest total number of rape:", state_with_largest_rape, "\n")

max_murder_state <- data %>%
  filter(Murder == max(Murder)) %>%
  select(State) %>%
  pull()
min_murder_state <- data %>%
  filter(Murder == min(Murder)) %>%
  select(State) %>%
  pull()
cat("State with max crime rate for murder:", max_murder_state, "\n")
cat("State with min crime rate for murder:", min_murder_state, "\n")

correlation_matrix <- cor(data[, c("Murder", "Assault", "UrbanPop", "Rape")])
print("Correlation matrix:")
print(correlation_matrix)

median_assault_arrests <- median(data$Assault)
states_above_median_assault <- data %>%
  filter(Assault > median_assault_arrests) %>%
  pull(State)
cat("States with assault arrests more than median:", states_above_median_assault, "\n")

bottom_25_percent_murder <- data %>%
  filter(Murder < quantile(Murder, 0.25)) %>%
  pull(State)
cat("States in the bottom 25% of murder:", bottom_25_percent_murder, "\n")

ggplot(data, aes(x = Murder)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black", alpha = 0.7) +
  geom_density(fill = "orange", alpha = 0.5) +
  labs(title = "Histogram and Density Plot of Murder Arrests",
       x = "Murder Arrests",
       y = "Density") +
  theme_minimal()

ggplot(data, aes(x = UrbanPop, y = Murder, color = Assault)) +
  geom_point() +
  labs(title = "Relationship between Murder Arrest Rate, Urban Population, and Assault Arrest Rates",
       x = "Urban Population (%)",
       y = "Murder Arrests",
       color = "Assault Arrests") +
  scale_color_gradient(low = "blue", high = "red") +
  theme_minimal()

ggplot(data, aes(x = reorder(State, Murder), y = Murder)) +
  geom_bar(stat = "identity", fill = "dodgerblue") +
  labs(title = "Murder Rate by US State",
       x = "State",
       y = "Murder Rate") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
