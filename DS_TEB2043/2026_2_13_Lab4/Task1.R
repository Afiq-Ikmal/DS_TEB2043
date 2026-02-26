age <- c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,
         52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58)

age_factor <- factor(age)
age_levels <- levels(age_factor)
age_counts <- table(age)

ranges <- cut(age, breaks=seq(50, 60, by=2), include.lowest=TRUE, right=FALSE)
range_counts <- table(ranges)

cat("Staff Age & Total number of staff:\n")
print(age_counts)

cat("\nAge Range & Total number of staff:\n")
print(range_counts)
