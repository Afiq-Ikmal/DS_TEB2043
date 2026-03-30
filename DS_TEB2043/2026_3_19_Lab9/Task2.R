data(mtcars)

df <- mtcars[, c("mpg", "hp")]

df_log <- log(df)

df_std <- as.data.frame(scale(df))

normalize <- function(x) { return ((x - min(x)) / (max(x) - min(x))) }
df_minmax <- as.data.frame(lapply(df, normalize))

head(df_std)
head(df_minmax)

#The three normalization techniques transform the mtcars data in fundamentally different ways to suit specific modeling needs. Log transformation is most effective for compressing high-variance features like hp, making skewed data appear more normal or bell-shaped. Standard scaling (Z-score) centers the data at a mean of zero, which is ideal for models like Principal Component Analysis (PCA) that rely on variance, though it does not bound the data to a specific range. In contrast, Min-Max scaling squashes all values strictly between 0 and 1, ensuring that no single feature—such as the large values of hp—dominates the smaller values of mpg during distance-based calculations like KNN. Each method preserves the relative relationships within the data but prepares it for different mathematical assumptions.