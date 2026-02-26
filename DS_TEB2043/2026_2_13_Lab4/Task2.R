V1 <- c(2,3,1,5,4,6,8,7,9)
Matrix1 <- matrix(V1, nrow=3, ncol=3)

Matrix2 <- t(Matrix1)

colnames(Matrix1) <- colnames(Matrix2) <- c("Col1", "Col2", "Col3")
rownames(Matrix1) <- rownames(Matrix2) <- c("Row1", "Row2", "Row3")

addition       <- Matrix1 + Matrix2
subtraction    <- Matrix1 - Matrix2
multiplication <- Matrix1 * Matrix2  
division       <- Matrix1 / Matrix2  

cat("Matrix-1:\n")
print(Matrix1)

cat("\nMatrix-2 (Transposed):\n")
print(Matrix2)

cat("\nAddition Result:\n")
print(addition)

cat("\nSubtraction Result:\n")
print(subtraction)
