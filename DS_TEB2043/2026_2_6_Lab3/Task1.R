scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

grades <- cut(scores, 
              breaks = c(0, 49, 59, 69, 79, 89, 100), 
              labels = c("F", "E", "D", "C", "B", "A"), 
              include.lowest = TRUE)

pass_fail <- scores > 49

cat("Grade Counts:\n")
print(table(grades))

cat("\nPass Status (TRUE = Pass, FALSE = Fail):\n")
print(pass_fail)

