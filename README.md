# courses.it4i
This repo contains files, for various trainings for R provided by IT4Innovations.
It is created as an R package which contains helper functions and Rmd documents (in inst/tutorial folder) with courses.

# Installation

You can install repository by calling

```{r}
remotes::install_github("It4innovations/r-courses")
```

# Courses

## Exploratory analysis

Start course with:

```{r}
learnr::run_tutorial("exploratory_analysis", package = "courses.it4i")
```

## XGBoost with caret

Start course with:

```{r}
learnr::run_tutorial("XGBoost_caret_modelling", package = "courses.it4i")
```
