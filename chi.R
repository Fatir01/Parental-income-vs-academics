# Load necessary packages
library(readxl)

# Load the cleaned dataset
data <- read_excel("D:/uni/sem 4/Satistical Interference/assignment/Parental_Income_VS_Academic.xlsx")

# Create a contingency table
table_data <- table(data$`How would you describe your family's financial situation?`,
                    data$`Academic Performance (Range)`)

# Run Chi-square test
chisq_result <- chisq.test(table_data)

# View the results
print(chisq_result)

# Interpret the result
if (chisq_result$p.value < 0.05) {
  cat("Result: Reject the null hypothesis (H₀). Academic success is related to parental income.\n")
} else {
  cat("Result: Fail to reject the null hypothesis (H₀). No significant relationship found.\n")
}
