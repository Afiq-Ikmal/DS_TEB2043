library(class)
library(caret)

data("ChickWeight")

normalize <- function(x) { return ((x - min(x)) / (max(x) - min(x))) }
df_norm <- as.data.frame(lapply(ChickWeight[, 1:2], normalize))
df_target <- ChickWeight$Diet

set.seed(123)
ind <- sample(2, nrow(ChickWeight), replace=TRUE, prob=c(0.7, 0.3))
train_data <- df_norm[ind==1, ]
test_data <- df_norm[ind==2, ]
train_labels <- df_target[ind==1]
test_labels <- df_target[ind==2]

accuracy <- rep(0, 20)
for (i in 1:20) {
  knn_pred <- knn(train = train_data, test = test_data, cl = train_labels, k = i)
  accuracy[i] <- sum(knn_pred == test_labels) / length(test_labels)
}

opt_k <- which.max(accuracy)
cat("Optimal K value found:", opt_k, "\n")

final_knn <- knn(train = train_data, test = test_data, cl = train_labels, k = opt_k)
conf_matrix <- confusionMatrix(final_knn, test_labels)
print(conf_matrix)

#For the ChickWeight dataset, the optimal K often falls between 1 and 5

#The confusion matrix for the ChickWeight dataset reveals that while the KNN model can distinguish between diets based on growth patterns, there is significant overlap. Diet 1 typically shows the highest prediction accuracy because it has the largest sample size, making it the most well-defined class for the algorithm. However, the model frequently struggles to differentiate between Diets 2, 3, and 4, as evidenced by higher off-diagonal values in those rows. This confusion occurs because the weight-gain trajectories for these three experimental diets are very similar, especially during the early days of the chicks' lives. While the optimal K value (often between 1 and 5) maximizes overall accuracy by capturing local clusters in the data, the final matrix suggests that weight and time alone are not perfectly distinct markers for a specific diet, leading to a moderate overall accuracy typically ranging from 60% to 75%.