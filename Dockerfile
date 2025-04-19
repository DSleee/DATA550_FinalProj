FROM rocker/tidyverse AS  base

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
COPY code code
COPY Makefile .
COPY report.Rmd .
COPY Boston.csv .
COPY depend_package.R .

RUN mkdir -p renv
COPY .Rprofile .
COPY renv.lock .
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e "renv::restore(prompt=FALSE)"
RUN Rscript depend_package.R
RUN mkdir report

RUN apt-get update && apt-get install -y pandoc
CMD make && cp report.html report

