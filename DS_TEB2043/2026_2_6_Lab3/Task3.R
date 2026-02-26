df <- data.frame(
  Name = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"),
  Chemistry = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59),
  Physics = c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)
)

chem_fail <- sum(df$Chemistry <= 49)
phys_fail <- sum(df$Physics <= 49)

best_chem_val <- max(df$Chemistry)
best_phys_val <- max(df$Physics)

best_chem_name <- df$Name[df$Chemistry == best_chem_val]
best_phys_name <- df$Name[df$Physics == best_phys_val]

cat("Fails - Chemistry:", chem_fail, "| Physics:", phys_fail, "\n")
cat("Highest Chemistry:", best_chem_val, "by", best_chem_name, "\n")
cat("Highest Physics:", best_phys_val, "by", best_phys_name, "\n")
