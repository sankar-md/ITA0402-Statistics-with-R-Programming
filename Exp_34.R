
missing_values <- sapply(airquality, function(x) sum(is.na(x)))

missing_percentage <- missing_values / nrow(airquality) * 100

columns_to_impute <- names(missing_percentage[missing_percentage < 10])

airquality[, columns_to_impute] <- lapply(airquality[, columns_to_impute], function(x) {
  if (any(is.na(x))) replace(x, is.na(x), mean(x, na.rm = TRUE)) else x
})

lm_model <- lm(Ozone ~ Solar.R, data = airquality)

summary(lm_model)

