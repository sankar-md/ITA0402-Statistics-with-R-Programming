
set.seed(42)  
sample_letters <- sample(LETTERS, 20, replace = TRUE)
sample_factor <- factor(sample_letters)


selected_levels <- levels(sample_factor)[1:5]


print(selected_levels)
