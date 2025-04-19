report.html: code/03_make_report.R \
	report.Rmd output/uni_table.rds output/multi_table.rds output/co_eff1.rds output/co_eff2.rds
	Rscript code/03_make_report.R

output/uni_table.rds: code/01_make_uni_table.R
	Rscript code/01_make_uni_table.R

output/multi_table.rds output/step_result.rds: code/01_make_multi_table.R
	Rscript code/01_make_multi_table.R

output/co_eff1.rds output/co_eff2.rds: code/02_make_figure.R output/step_result.rds
	Rscript code/02_make_figure.R


.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	Rscript depend_package.R


PROJECTFILES = report.Rmd depend_package.R code/01_make_multi_table.R code/01_make_uni_table.R code/02_make_figure.R code/03_make_report.R Makefile Boston.csv
REVFILES = renv.lock renv/activate.R renv/settings.json .Rprofile

project_image: Dockerfile	$(PROJECTFILES)	$(RENVFILES)
	docker build -t dslee95/project_image .
	touch $@

report_gen:
	docker run -v /"$$(pwd)/report":/project/report dslee95/project_image

