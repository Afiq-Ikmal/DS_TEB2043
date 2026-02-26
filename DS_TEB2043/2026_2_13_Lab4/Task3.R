arr1 <- array(1:24, dim = c(2, 4, 3))

arr2 <- array(25:54, dim = c(3, 2, 5))

cat("Array1:\n")
print(arr1)

cat("\nArray2:\n")
print(arr2)

cat("\nThe second row of the second matrix of the array:\n")
print(arr1[2, , 2])

cat("\nThe element in the 3rd row and 2nd column of the 1st matrix:\n")
print(arr2[3, 2, 1])
