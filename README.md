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

## [XGBoost](https://xgboost.readthedocs.io/en/stable/) with [caret](http://topepo.github.io/caret/index.html)

Start course with:

```{r}
learnr::run_tutorial("XGBoost_caret_modelling", package = "courses.it4i")
```

You can also use [docker container](https://www.docker.com/resources/what-container/) by running 
```{bash}
docker build -t rtutorial .
docker run -p 3838:3838 --rm rtutorial 
```

After that the training will run on a port 3838 of a localhost.
You can access it by typing `localhost:3838` into Your browser.

The prepared docker file runs the EDA tutorial by default to run the [XGBoost](https://xgboost.readthedocs.io/en/stable/) with [caret](http://topepo.github.io/caret/index.html) tutorial You can start the container with the following command

```{bash}
docker run --entrypoint R -p 3838:3838 --name xgboost_training --rm rtutorial "-e" "options('shiny.port'=3838,shiny.host='0.0.0.0');learnr::run_tutorial(name = 'XGBoost_caret_modelling', package = 'courses.it4i')"
```
