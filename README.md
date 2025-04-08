# 💤 Sleep Health and Lifestyle – Exploratory Data Analysis (EDA)

This repository contains an exploratory data analysis (EDA) of the **Sleep Health and Lifestyle Dataset**, which explores how various lifestyle and health indicators influence sleep quality, duration, and disorders.

## 📊 Dataset Overview

The dataset includes information on **374 individuals** and contains the following **13 features**:

- **Person ID**: Unique identifier for each person
- **Gender**: Male / Female
- **Age**: In years
- **Occupation**: Profession
- **Sleep Duration**: Hours of sleep per day
- **Quality of Sleep**: Subjective rating (1–10)
- **Physical Activity Level**: Daily minutes of physical activity
- **Stress Level**: Subjective rating (1–10)
- **BMI Category**: Underweight / Normal / Overweight / Obese
- **Blood Pressure**: Systolic/Diastolic
- **Heart Rate**: Beats per minute (resting)
- **Daily Steps**: Steps walked per day
- **Sleep Disorder**: None / Insomnia / Sleep Apnea

## 🎯 Objectives

The EDA focuses on the following questions:

1. **What is the average sleep duration across age groups, occupations, and BMI levels?**
2. **How do stress levels impact sleep quality?**
3. **Which lifestyle factors significantly affect sleep duration and sleep disorders?**
4. **Are there any gender-based differences in sleep health and habits?**
5. **How do health indicators like BMI and physical activity relate to sleep?**
6. **How do lifestyle patterns differ between individuals with and without sleep disorders?**

## 🛠️ Tools Used

- **R** (ggplot2, dplyr, tidyverse)
- **Visualization**: Bar plots, box plots, scatter plots, correlation matrices

## 📁 Files

- `Sleep_health_and_lifestyle_dataset.csv` – The dataset used for the analysis.
- `sleep_health_eda.R` – R script with complete EDA and plots.
- `README.md` – This file.

## 📈 Key Insights

- Younger individuals and those with normal BMI tend to sleep more.
- High stress is negatively associated with sleep quality.
- Physical activity and step count show moderate associations with sleep duration.
- Gender-based differences exist in activity levels and heart rate.
- Individuals with **Sleep Apnea** and **Insomnia** have higher stress and lower sleep durations.
