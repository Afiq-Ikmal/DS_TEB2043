num <- 1634

digits <- as.numeric(strsplit(as.character(num), "")[[1]])

armstrong_sum <- sum(digits^3)

if (num == armstrong_sum) {
  cat(num, "is an Armstrong number.\n")
} else {
  cat(num, "is not an Armstrong number.\n")
}