# Load the iris dataset
data(iris)

# (i) Dimension, Structure, Summary statistics, Standard Deviation of all features
cat("(i) Dimension of the dataset:\n")
print(dim(iris))
cat("\n")

cat("(i) Structure of the dataset:\n")
str(iris)
cat("\n")

cat("(i) Summary statistics of the dataset:\n")
summary(iris)
cat("\n")

cat("(i) Standard Deviation of all features:\n")
sapply(iris[, 1:4], sd)
cat("\n")

# (ii) Mean and standard deviation of features grouped by species
cat("(ii) Mean and Standard Deviation of features grouped by species:\n")
aggregate(. ~ Species, data = iris, FUN = function(x) c(Mean = mean(x), SD = sd(x)))
cat("\n")

# (iii) Quantile value of sepal width and length
cat("(iii) Quantile value of sepal width and length:\n")
quantile(iris$Sepal.Width)
quantile(iris$Sepal.Length)
cat("\n")

# (iv) Create a new data frame 'iris1' with a new categorical column 'Sepal.Length.Cate'
quantiles <- quantile(iris$Sepal.Length, probs = c(0, 0.25, 0.5, 0.75, 1))
iris$Sepal.Length.Cate <- cut(iris$Sepal.Length, breaks = quantiles, labels = c("Q1", "Q2", "Q3", "Q4"))

# (v) Average value of numerical variables by Species and Sepal.Length.Cate
cat("(v) Average value of numerical variables by Species and Sepal.Length.Cate:\n")
aggregate(. ~ Species + Sepal.Length.Cate, data = iris, FUN = mean)
cat("\n")

# (vi) Average mean value of numerical variables by Species and Sepal.Length.Cate
cat("(vi) Average mean value of numerical variables by Species and Sepal.Length.Cate:\n")
aggregate(. ~ Species + Sepal.Length.Cate, data = iris, FUN = function(x) mean(x, na.rm = TRUE))
cat("\n")

# (vii) Create a Pivot Table based on Species and Sepal.Length.Cate
cat("(vii) Pivot Table based on Species and Sepal.Length.Cate:\n")
pivot_table <- with(iris, tapply(Sepal.Width, list(Species, Sepal.Length.Cate), mean))
print(pivot_table)
