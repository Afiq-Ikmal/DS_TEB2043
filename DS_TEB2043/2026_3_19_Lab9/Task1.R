library(ggcorrplot)

data("ToothGrowth")

corr_matrix <- cor(ToothGrowth[, c("len", "dose")])

ggcorrplot(corr_matrix, 
           hc.order = TRUE, 
           type = "lower", 
           lab = TRUE, 
           title = "Correlation Heatmap: ToothGrowth")

#The value 0.8 in the center confirms a strong positive relationship, meaning as the dose increases, the tooth length consistently increases as well. The bright orange/red color matches the scale on the right, visually indicating this high positive correlation.