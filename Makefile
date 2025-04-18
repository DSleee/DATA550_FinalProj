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



