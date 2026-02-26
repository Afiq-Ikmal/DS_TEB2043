# Load libraries
library(tidyverse)
library(janitor)

# Load dataset 
df <- read_csv("Unclean Dataset.csv", show_col_types = FALSE)

# Inspect dataset 
cat("Total Duplicate:", sum(duplicated(df)), "\n")
print(colSums(is.na(df)))
print(sapply(df, class))
print(summary(df))
print(head(df))

# 1. Remove duplicates
df <- df %>% distinct()
cat("Duplicates Elimination Success!\n")

# 2. Handle missing values
for (col in names(df)) {
  if (is.character(df[[col]])) {
    mode_val <- df %>%
      filter(!is.na(.data[[col]])) %>%
      count(.data[[col]]) %>%
      arrange(desc(n)) %>%
      slice(1) %>%
      pull(.data[[col]])
    
    df[[col]][is.na(df[[col]])] <- mode_val
  } else {
    df[[col]][is.na(df[[col]])] <- median(df[[col]], na.rm = TRUE)
  }
}
cat("Handle missing values success!\n")

# 3. Convert types if possible 
for (col in names(df)) {
  suppressWarnings({
    converted <- as.numeric(df[[col]])
    if (!all(is.na(converted))) {
      df[[col]] <- converted
    }
  })
}
cat("Successfully converted unsuitable data types!\n")

# 4. Remove special characters in 'price' column if exists
if ("price" %in% names(df)) {
  df <- df %>%
    mutate(price = as.numeric(str_replace_all(price, "[^0-9.]", "")))
}
cat("Remove special characters success!\n")

# 5. Outlier removal using IQR 
df_numeric <- df %>% select(where(is.numeric))

Q1 <- df_numeric %>% summarise(across(everything(), ~quantile(.x, 0.25, na.rm = TRUE)))
Q3 <- df_numeric %>% summarise(across(everything(), ~quantile(.x, 0.75, na.rm = TRUE)))
IQR <- Q3 - Q1

cat("Handled outlier using IQR!\n")

df_cleaned <- df %>%
  filter(
    !if_any(
      where(is.numeric),
      ~ .x < (Q1[[cur_column()]] - 1.5 * IQR[[cur_column()]]) |
        .x > (Q3[[cur_column()]] + 1.5 * IQR[[cur_column()]])
    )
  )

cat("Outlier successfully cleaned!\n")

# 6. Save cleaned dataset
write_csv(df_cleaned, "Cleaned_Dataset.csv")

cat("Cleaned dataset stored as 'Cleaned_Dataset.csv'\n")

# Final checks
cat("Total duplicates:", sum(duplicated(df_cleaned)), "\n")
print(colSums(is.na(df_cleaned)))
print(sapply(df_cleaned, class))
print(summary(df_cleaned))
print(head(df_cleaned))
