# Set seed for reproducibility
set.seed(123)

# Generate a dummy dataset for neurosurgery experiment
n <- 60  # Number of observations

# Variables
gender <- sample(c("Male", "Female"), n, replace = TRUE)
drug <- sample(c("A", "B"), n, replace = TRUE)
procedure <- sample(c("X", "Y", "Z"), n, replace = TRUE)
age <- rnorm(n, mean = 40, sd = 10)
pre_op_score <- rnorm(n, mean = 70, sd = 5)
post_op_score <- pre_op_score + rnorm(n, mean = 5, sd = 3)

# Create interactions for significant effects
interaction_effect_1 <- ifelse(drug == "A" & procedure == "Z", 3, 0)
interaction_effect_2 <- ifelse(drug == "B" & procedure == "Y" & gender == "Female", 2, 0)

# Generate continuous outcome variable with added effects
outcome <- post_op_score + interaction_effect_1 + interaction_effect_2

# Create the dataframe
data <- data.frame(
  Gender = factor(gender),
  Drug = factor(drug),
  Procedure = factor(procedure),
  Age = age,
  PreOpScore = pre_op_score,
  PostOpScore = outcome
)

write.csv(data, "Exercise2_data.csv", row.names = F)
