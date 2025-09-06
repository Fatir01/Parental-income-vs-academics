# Group into High and Low income based on refined logic
data$Income_Group <- ifelse(
  data$`How would you describe your family's financial situation?` %in% 
    c("We are very comfortable financially", "We are comfortable"),
  "High", 
  "Low"
)

# Define 'high performer' as those with 80% or above
data$High_Performer <- ifelse(
  data$`Academic Performance (Range)` %in% c("80%-90%", "90% and above"),
  1, 0
)

# Split the data
high_group <- subset(data, Income_Group == "High")
low_group  <- subset(data, Income_Group == "Low")

# Successes and sample sizes
x1 <- sum(high_group$High_Performer)
x2 <- sum(low_group$High_Performer)
n1 <- nrow(high_group)
n2 <- nrow(low_group)

# Proportion test (Z-test)
prop_test <- prop.test(x = c(x1, x2), n = c(n1, n2), correct = FALSE)

# Print results
print(prop_test)

# Interpretation
if (prop_test$p.value < 0.05) {
  cat("\nConclusion: Reject the null hypothesis — proportion of high-performing students differs significantly by income level.\n")
} else {
  cat("\nConclusion: Fail to reject the null hypothesis — no significant difference in academic performance proportions by income.\n")
}
