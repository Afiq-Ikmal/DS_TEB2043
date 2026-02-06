calculate_bmi <- function() {
  
  weight <- as.numeric(readline(prompt = "Enter your weight in kg: "))
  height_m <- as.numeric(readline(prompt = "Enter your height in m: "))
  
  bmi <- weight / (height_m ^ 2)
  bmi <- round(bmi,1)

if (bmi < 18.4) {
  status <- "Underweight"
} else if (bmi >= 18.5 && bmi < 24.9) {
  status <- "Normal"
} else if (bmi >= 25 && bmi < 39.9) {
  status <- "Overweight"
} else {
  status <- "Obese"
}
  
  cat("Your BMI is:", bmi, "\n")
  cat("Status:", status, "\n")
}

calculate_bmi()