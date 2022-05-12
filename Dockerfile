FROM rocker/r-ver:4.2.0
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("visdat",upgrade="never", version = "0.5.3")'
RUN Rscript -e 'remotes::install_version("recipes",upgrade="never", version = "0.2.0")'
RUN Rscript -e 'remotes::install_version("pROC",upgrade="never", version = "1.18.0")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.1")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("outliers",upgrade="never", version = "0.15")'
RUN Rscript -e 'remotes::install_version("naniar",upgrade="never", version = "0.6.1")'
RUN Rscript -e 'remotes::install_version("caret",upgrade="never", version = "6.0-92", depependencies = c("Depends", "Imports", "Suggests"))'
RUN Rscript -e 'remotes::install_version("xgboost",upgrade="never", version = "1.6.0.1")'
RUN Rscript -e 'remotes::install_version("learnr",upgrade="never", version = "0.10.1")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.3.2")'
RUN Rscript -e 'remotes::install_version("ROSE",upgrade="never", version = "0.0-4")'
RUN Rscript -e 'remotes::install_version("DMwR2",upgrade="never", version = "0.0.2")'
RUN Rscript -e 'remotes::install_github("It4innovations/r-courses", upgrade = "never")'
RUN Rscript -e 'remotes::install_version("skimr",upgrade="never", version = 2.1.4")'
EXPOSE 3838
CMD  ["R", "-e", "options('shiny.port'=3838,shiny.host='0.0.0.0');learnr::run_tutorial(name = 'exploratory_analysis', package = 'courses.it4i')"]
