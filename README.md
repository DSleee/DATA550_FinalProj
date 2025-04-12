# Generate report
- This analysis was conducted using the `Boston.csv` dataset.

# Contents of the report
- The final report includes a univariate regression analysis table and a multivariate analysis table, which was generated using significant variables. The coefficients from each analysis are presented as bar plots.


## Analysis process

**IMPORTANT:** You can install the project environment by running `make install`.

1. Run `code/01_make_uni_table.R`
    - This script generates the univariate regression analysis table (output: `uni_table.rds`).
2. Run `code/01_make_multi_table.R`
    - This script performs multivariable regression using the significant variables selected by stepwise selection, and creates the multivariate regression analysis table (output: `step_result.rds` and `multi_table.rds`).
3. Run `code/02_make_figure.R`
    - This script depends on `step_result.rds` and generates bar plots for the regression coefficients (output: `co_eff1.rds` and `co_eff2.rds`).
4. Run `code/03_make_report.R`
    - This script generates the final report using `report.Rmd`, along with the previously generated `.rds` files. The R script generates the final report with analysis results.
(output: `report.html`).
* all `.rds` files saved in the `output` folder.
## Quick Guide for generating the final report
Just run `make` in the terminal!


