# Report analysis
- This analysis was conducted using the `Boston.csv` dataset.

# Contents of the report
- The final report includes a univariate regression analysis table and a multivariate analysis table, which was generated using significant variables. The coefficients from each analysis are presented as bar plots.

## 🧾 Report Generation

You can generate the report in two ways:  
**with Docker** or **without Docker**.

---

### 🐳 **Report Generation _with_ Docker**

Easily generate the report using `docker` and `make`.

#### 🚀 1. Build the Docker Image (choose one)

- **Option 1**: Use `make`
  ```bash
  make project_image
  ```

- **Option 2**: Pull from Docker Hub (https://hub.docker.com/repository/docker/dslee95/project_image/general)
  ```bash
  docker pull dslee95/project_image:latest
  ```

- **Option 3**: Build manually
  ```bash
  docker build -t dslee95/project_image .
  ```

#### ⚙️ 2. Generate the Report

- **For Windows**
  ```bash
  make report_win
  ```

- **For macOS / Linux**
  ```bash
  make report_mac
  ```

#### 📁 3. Output

The final report will be available in the `report/` folder.

---

### 🖥️ **Report Generation _without_ Docker**

If you have R and the required packages installed, you can generate the report directly using `make`.

#### 1. Install packages via renv

```bash
make install
```

#### 2. Generate the report

```bash
make
```

#### 📁 Output

The final report will be available in the project folder.

## Analysis process

**Assume environment was already established**

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


