FROM rocker/verse:4.2.2
RUN apt-get update && apt-get install -y  libcurl4-openssl-dev libglpk-dev libgmp-dev libicu-dev librsvg2-dev libssl-dev libv8-dev libxml2-dev make pandoc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("ggplot2",upgrade="never", version = "3.4.2")'
RUN Rscript -e 'remotes::install_version("recipes",upgrade="never", version = "1.0.5")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.4")'
RUN Rscript -e 'remotes::install_version("visdat",upgrade="never", version = "0.6.0")'
RUN Rscript -e 'remotes::install_version("pROC",upgrade="never", version = "1.18.0")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("randomForest",upgrade="never", version = "4.7-1.1")'
RUN Rscript -e 'remotes::install_version("vtree",upgrade="never", version = "5.6.5")'
RUN Rscript -e 'remotes::install_version("ranger",upgrade="never", version = "0.15.1")'
RUN Rscript -e 'remotes::install_version("tidymodels",upgrade="never", version = "1.0.0")'
RUN Rscript -e 'remotes::install_version("DMwR2",upgrade="never", version = "0.0.2")'
RUN Rscript -e 'remotes::install_version("ROSE",upgrade="never", version = "0.0-4")'
RUN Rscript -e 'remotes::install_version("outliers",upgrade="never", version = "0.15")'
RUN Rscript -e 'remotes::install_version("naniar",upgrade="never", version = "1.0.0")'
RUN Rscript -e 'remotes::install_version("caret",upgrade="never", version = "6.0-94")'
RUN Rscript -e 'remotes::install_version("xgboost",upgrade="never", version = "1.7.5.1")'
RUN Rscript -e 'remotes::install_version("learnr",upgrade="never", version = "0.11.2")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.4.0")'
RUN Rscript -e 'remotes::install_version("skimr",upgrade="never", version = "2.1.5")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 3838
CMD  ["R", "-e", "options('shiny.port'=3838,shiny.host='0.0.0.0');library(courses.it4i);courses.it4i::run_app()"]
