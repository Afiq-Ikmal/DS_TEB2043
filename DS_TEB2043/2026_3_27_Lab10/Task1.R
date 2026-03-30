data("Theoph")

model <- lm(Dose ~ Wt, data = Theoph)

summary(model)

plot(Theoph$Wt, Theoph$Dose, main="Dose vs Weight", xlab="Weight (kg)", ylab="Dose (mg/kg)", pch=19)
abline(model, col="red", lwd=2)

#The intercept represents the theoretical dose when weight is zero. The Weight (Wt) coefficient indicates that for every 1kg increase in weight, the administered dose decreases by approximately 0.078 mg/kg.

#A very low p-value for the Wt variable suggests a statistically significant relationship between weight and dose.

#An R^2 value near 0.97 indicates that weight explains about 97% of the variance in the dose, showing a very strong linear fit.

new_weights <- data.frame(Wt = c(90, 95, 100))

predicted_doses <- predict(model, newdata = new_weights)
print(predicted_doses)

#The predicted doses for the specified weights are approximately: 90kg - 3.04mg/kg , 95kg - 2.65mg/kg , 100kg - 2.26mg/kg
