# Load required library
library(readxl)

# Load the Excel file
data <- read_excel("D:/uni/sem 4/Satistical Interference/assignment/Parental_Income_VS_Academic.xlsx")

# Map academic performance to numeric values for ANOVA
performance_map <- c("Below 60%" = 1,
                     "60%-70%" = 2,
                     "70%-80%" = 3,
                     "80%-90%" = 4,
                     "90% and above" = 5)

data$Performance_Score <- performance_map[data$`Academic Performance (Range)`]

# Run one-way ANOVA
anova_result <- aov(Performance_Score ~ `How would you describe your family's financial situation?`, data = data)

# Show ANOVA summary
summary_result <- summary(anova_result)
print(summary_result)

# Extract p-value from ANOVA table
p_val <- summary_result[[1]]$`Pr(>F)`[1]

p_val
# Interpret the result
if (p_val < 0.05) {
  cat("\nConclusion: Reject the null hypothesis (H₀). Academic performance significantly differs by parental income.\n")
} else {
  cat("\nConclusion: Fail to reject the null hypothesis (H₀). No significant difference in academic performance across income groups.\n")
}
