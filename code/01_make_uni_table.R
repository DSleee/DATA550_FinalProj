here::i_am("code/01_make_uni_table.R")
data = read.csv('Boston.csv',header=T)

library(gtsummary)
library(labelled)
library(gt)
library(broom)
library(ggplot2)

uni_table = tbl_uvregression(
  data = data,
  method = lm,              
  y = medv,                  
  method.args = list(na.action = na.exclude)  
  ,) %>%
  as_gt() %>%
  tab_caption("Table 1. Univariate Regression Analysis") %>%     
  tab_header(
    title = "Univariate Analysis Results",                          
    subtitle = "Linear Regression for Each Variable in Boston dataset"      
  ) %>%
  tab_source_note("Note. P-values are significant at p < 0.05.") %>%              
  tab_source_note(md("All variables had statistically significant relationships with the target variable (medv)."))

saveRDS(uni_table, file = here::here("output/uni_table.rds"))
