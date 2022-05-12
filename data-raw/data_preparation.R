# Load libraries ----
library(readr)
library(dplyr)
# Load and adjust heart_2020_cleaned.csv ----
# Data download from https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease on 9th May 2022
# Link to license https://creativecommons.org/publicdomain/zero/1.0/

heart <- read_csv("data-raw/heart_2020_cleaned.csv") |>
  mutate(HeartDisease = as.factor(HeartDisease))

set.seed(10971)
heart_small <- heart[sample(1:nrow(heart), 2000),] |>
  mutate(
    Smoking = ifelse(grepl("No", Smoking), 0, 1),
    AlcoholDrinking = ifelse(grepl("No", AlcoholDrinking), 0, 1),
    Stroke = ifelse(grepl("No", Stroke), 0, 1),
    DiffWalking = ifelse(grepl("No", DiffWalking), 0, 1),
    Diabetic = ifelse(grepl("No", Diabetic), 0, 1),
    PhysicalActivity = ifelse(grepl("No", PhysicalActivity), 0, 1),
    Asthma = ifelse(grepl("No", Asthma), 0, 1),
    KidneyDisease = ifelse(grepl("No", KidneyDisease), 0, 1),
    SkinCancer = ifelse(grepl("No", SkinCancer), 0, 1),
    Sex = ifelse(grepl("Male", Sex), 0, 1),
    GenHealth = case_when(GenHealth == "Poor" ~ 1,
                          GenHealth == "Fair" ~ 2,
                          GenHealth == "Good" ~ 3,
                          GenHealth == "Very good" ~ 4,
                          GenHealth == "Excellent" ~ 5,
                          TRUE ~ NA_real_
    ),
    AgeCategory = case_when(grepl("2", AgeCategory) ~ 1,
                            grepl("3", AgeCategory) | grepl("-4", AgeCategory) | grepl("-5", AgeCategory) ~ 2,
                            TRUE ~ 3),
    Race = as.numeric(as.factor(Race))
  )

usethis::use_data(heart, heart_small, overwrite = TRUE)
