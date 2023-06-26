# courses.it4i
This repo contains files, for various trainings for R provided by IT4Innovations.
It is created as an R package which contains helper functions and Rmd documents (in inst/tutorial folder) with courses.

# Installation

You can install repository by calling

```{r}
remotes::install_github("It4innovations/r-courses")
```

# Trainings

## [Data science with R and Python](https://events.prace-ri.eu/event/1390/)

### Exploratory analysis in R

It is contained in folder `"Exploratory_Analysis_May_2022"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("Exploratory_Analysis_May_2022", package = "courses.it4i")
```

### XGBoost basics

It is contained in folder `"XGBoost_Caret_Modelling_May_2022"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("XGBoost_Caret_Modelling_May_2022", package = "courses.it4i")
```

## [High Performance Data Analysis with R](https://events.it4i.cz/event/163/)

### Exploratory data analysis in R

It is contained in folder `"Exploratory_Analysis_April_2023"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("Exploratory_Analysis_April_2023", package = "courses.it4i")
```

### Introduction to modelling using Tidymodels

It is contained in folder `"Tidymodels_April_2023"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("Tidymodels_April_2023", package = "courses.it4i")
```

## [HPC in Data Science: focus on Big Data and AI](https://sctrain.eu/course/big-data-and-ai)

### Introduction to R

It is contained in folder `"SCTrain_Introduction_to_R_June_2023"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("SCTrain_Introduction_to_R_June_2023", package = "courses.it4i")
```

### Exploratory Data Analysis with R

It is contained in folder `"SCTrain_EDA_June_2023"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("SCTrain_EDA_June_2023", package = "courses.it4i")
```

### Modelling with R

It is contained in folder `"SCTrain_Tidymodels_June_2023"`.

Run the training by executing following code in  [RStudio](https://posit.co/products/open-source/rstudio/):

```r
learnr::run_tutorial("SCTrain_Tidymodels_June_2023", package = "courses.it4i")
```

# Docker

You can also use [docker container](https://www.docker.com/resources/what-container/) by running 
```{bash}
docker build -t rtutorial .
docker run -p 3838:3838 --rm rtutorial 
```

After that the training will run on a port 3838 of a localhost.
You can access it by typing `localhost:3838` into Your browser.

To run specific tutorial You need to change the folder name in the `learnr::run_tutorial('folder_name', package = 'courses.it4i')` part of the following command. 

```{bash}
docker run --entrypoint R -p 3838:3838 --name eda_sctrain --rm rtutorial "-e" "options('shiny.port'=3838,shiny.host='0.0.0.0');learnr::run_tutorial('SCTrain_EDA_June_2023', package = 'courses.it4i')"
```
