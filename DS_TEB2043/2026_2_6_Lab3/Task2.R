students <- c(Robert=59, Hemsworth=71, Scarlett=83, Evans=68, Pratt=65, 
              Larson=57, Holland=62, Paul=92, Simu=92, Renner=59)

high_val <- max(students)
low_val  <- min(students)
avg_val  <- mean(students)

high_names <- names(students[students == high_val])
low_names  <- names(students[students == low_val])

cat("Highest Score:", high_val, "\n")
cat("Lowest Score:", low_val, "\n")
cat("Average Score:", avg_val, "\n")
cat("Student(s) with Highest Score:", high_names, "\n")
cat("Student(s) with Lowest Score:", low_names, "\n")
