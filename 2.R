# Create income groups
data$Income_Group <- ifelse(
  data$`How would you describe your family's financial situation?` %in%
    c("We are very comfortable financially", "We are comfortable"),
  "High", "Low"
)

# Make sure Study Hours is a factor (categorical)
data$Study_Hours <- as.factor(data$`How many hours per week do you study on average?`)

# Build contingency table
tbl <- table(data$Income_Group, data$Study_Hours)

# Perform Chi-square test
chi_result <- chisq.test(tbl)

# View result
print(chi_result)

# Interpretation
if (chi_result$p.value < 0.05) {
  cat("Result: Reject H₀ — Study hours are related to income level.\n")
} else {
  cat("Result: Fail to reject H₀ — No significant relationship between study hours and income level.\n")
}
