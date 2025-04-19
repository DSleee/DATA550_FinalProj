FROM rocker/tidyverse as base

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
RUN mkdir data
COPY code code
COPY Makefile .
COPY report.Rmd .
COPY Boston.csv .

RUN mkdir -p renv
COPY .Rprofile .
COPY renv.lock .
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir report

RUN apt-get update && apt-get install -y pandoc
CMD make && cp report.html report

