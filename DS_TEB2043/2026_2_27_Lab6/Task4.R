df <- data.frame(
  name = c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas", "Emily"),
  score = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0, 14.5),
  attempts = c(1, 3, 2, 3, 2, 1, 2, 1),
  qualify = c("yes", "no", "yes", "no", "no", "no", "yes", "yes")
)

df$qualify <- as.factor(df$qualify)

cat("--- Structure ---\n")
str(df)

cat("\n--- Summary ---\n")
summary(df)

cat("\n--- Dimensions ---\n")
cat("Number of Rows:", nrow(df), "\n")
cat("Number of Columns:", ncol(df), "\n")