# Load necessary libraries
library(tidyverse)
library(ggplot2)
library(ggthemes)

# Read the dataset
df <- read.csv(file.choose())

# Clean column names
names(df) <- make.names(names(df))

# Convert relevant variables to factors
df$Gender <- as.factor(df$Gender)
df$BMI.Category <- as.factor(df$BMI.Category)
df$Occupation <- as.factor(df$Occupation)
df$Sleep.Disorder <- as.factor(df$Sleep.Disorder)

# Create Age Groups
df <- df %>%
  mutate(Age.Group = cut(Age, breaks = c(17, 25, 35, 45, 60, 100),
                         labels = c("18-25", "26-35", "36-45", "46-60", "60+")))

# -----------------------------
# 1. Average Sleep Duration by Age, Occupation, and BMI
# -----------------------------

# Age Group
ggplot(df, aes(x = Age.Group, y = Sleep.Duration)) +
  stat_summary(fun = mean, geom = "bar", fill = "skyblue") +
  labs(title = "Average Sleep Duration by Age Group", y = "Average Sleep Duration (hrs)", x = "Age Group") +
  theme_minimal()

# Occupation
df %>%
  group_by(Occupation) %>%
  summarise(Average.Sleep = mean(Sleep.Duration)) %>%
  ggplot(aes(x = reorder(Occupation, Average.Sleep), y = Average.Sleep)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Average Sleep Duration by Occupation", x = "Occupation", y = "Average Sleep Duration") +
  theme_minimal()

# BMI Category
ggplot(df, aes(x = BMI.Category, y = Sleep.Duration)) +
  stat_summary(fun = mean, geom = "bar", fill = "coral") +
  labs(title = "Average Sleep Duration by BMI Category", x = "BMI Category", y = "Average Sleep Duration") +
  theme_minimal()

# -----------------------------
# 2. Relationship between Stress Level and Sleep Quality
# -----------------------------

ggplot(df, aes(x = Stress.Level, y = Quality.of.Sleep)) +
  geom_jitter(alpha = 0.5, color = "purple") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(title = "Stress Level vs. Sleep Quality", x = "Stress Level (1–10)", y = "Quality of Sleep (1–10)") +
  theme_minimal()

# -----------------------------
# 3. Lifestyle Factors affecting Sleep Duration & Disorders
# -----------------------------

# Correlation plot for lifestyle factors vs. sleep duration
lifestyle_vars <- df %>%
  select(Sleep.Duration, Physical.Activity.Level, Stress.Level, Heart.Rate, Daily.Steps)

pairs(lifestyle_vars, main = "Lifestyle Factors vs. Sleep Duration")

# Sleep Disorder distribution by Stress Level
ggplot(df, aes(x = Stress.Level, fill = Sleep.Disorder)) +
  geom_histogram(binwidth = 1, position = "dodge") +
  labs(title = "Sleep Disorder Distribution by Stress Level", x = "Stress Level", y = "Count") +
  theme_minimal()

# -----------------------------
# 4. Gender-based Differences in Sleep & Lifestyle
# -----------------------------

# Sleep Duration by Gender
ggplot(df, aes(x = Gender, y = Sleep.Duration, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Sleep Duration by Gender", y = "Sleep Duration", x = "Gender") +
  theme_minimal()

# Physical Activity by Gender
ggplot(df, aes(x = Gender, y = Physical.Activity.Level, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Physical Activity Level by Gender", y = "Activity Level (min/day)", x = "Gender") +
  theme_minimal()

# -----------------------------
# 5. Influence of Health Indicators on Sleep Duration
# -----------------------------

# Sleep Duration by BMI Category
ggplot(df, aes(x = BMI.Category, y = Sleep.Duration, fill = BMI.Category)) +
  geom_boxplot() +
  labs(title = "Sleep Duration by BMI Category", y = "Sleep Duration", x = "BMI") +
  theme_minimal()

# Sleep Duration vs. Physical Activity Level
ggplot(df, aes(x = Physical.Activity.Level, y = Sleep.Duration)) +
  geom_point(alpha = 0.6, color = "darkgreen") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(title = "Physical Activity vs. Sleep Duration", x = "Physical Activity (min/day)", y = "Sleep Duration (hrs)") +
  theme_minimal()

# -----------------------------
# 6. Lifestyle Patterns: With vs Without Sleep Disorders
# -----------------------------

# Daily Steps comparison
ggplot(df, aes(x = Sleep.Disorder, y = Daily.Steps, fill = Sleep.Disorder)) +
  geom_boxplot() +
  labs(title = "Daily Steps: With vs Without Sleep Disorders", x = "Sleep Disorder", y = "Daily Steps") +
  theme_minimal()

# Heart Rate comparison
ggplot(df, aes(x = Sleep.Disorder, y = Heart.Rate, fill = Sleep.Disorder)) +
  geom_boxplot() +
  labs(title = "Heart Rate: With vs Without Sleep Disorders", x = "Sleep Disorder", y = "Heart Rate (bpm)") +
  theme_minimal()

