set.seed(123)  # Set seed for reproducibility

# Generate 50 observations
n <- 50

# Create categorical predictors
predictor_A <- factor(sample(c("Male", "Female"), n, replace = TRUE))
predictor_B <- factor(sample(c("DrugA", "DrugB", "Placebo"), n, replace = TRUE))
predictor_C <- factor(sample(c("Normal", "Elevated", "Hyptertension_StageI", "Hyptertension_StageII"), n, replace = TRUE))

# Create interaction term between A and B
interaction_AB <- as.factor(paste(predictor_A, predictor_B, sep = "_"))

# Create numerical outcome and scale it so that it looks nicer
outcome <- rnorm(n, mean = ifelse(predictor_A == "Male" & predictor_B == "DrugB", 6, 2), sd = 2)
outcome <- rnorm(n, mean = ifelse(predictor_B == "DrugB" & predictor_C == "Hyptertension_StageI", 8, 2), sd = 2)
original_values <- outcome
scaled_values <- scale(original_values, center = min(original_values), scale = max(original_values) - min(original_values))
scaled_values <- scaled_values * 8 + 4
outcome <- scaled_values
outcome <- round(outcome,2)

# Create the dataset
dummy_dataset <- data.frame(Gender = predictor_A,
                            "Drug Administered" = predictor_B,
                            "Blood pressure Category" = predictor_C,
                            "Recovery Time (h)" = outcome)

# Testing to see if the expected relationships are there
res = aov(outcome ~ predictor_A*predictor_B*predictor_C, data = dummy_dataset)
summary(res)
