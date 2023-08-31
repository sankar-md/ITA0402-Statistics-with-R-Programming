
library(ggplot2)

data("ChickWeight")

boxplot_plot <- ggplot(ChickWeight, aes(x = as.factor(Diet), y = weight, group = Diet)) +
  geom_boxplot() +
  labs(title = "Box Plot of Weight Grouped by Diet", x = "Diet", y = "Weight") +
  theme_minimal()

histogram_plot <- ggplot(ChickWeight, aes(x = weight)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Weight for Diet-1", x = "Weight", y = "Frequency") +
  theme_minimal()

scatter_plot <- ggplot(ChickWeight, aes(x = Time, y = weight, color = as.factor(Diet))) +
  geom_point() +
  labs(title = "Scatter Plot of Weight vs Time Grouped by Diet", x = "Time", y = "Weight", color = "Diet") +
  theme_minimal()

print(boxplot_plot)
print(histogram_plot)
print(scatter_plot)
