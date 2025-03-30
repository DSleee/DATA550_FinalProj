here::i_am("code/01_make_multi_table.R")
data = read.csv('Boston.csv',header=T)

library(gtsummary)
library(labelled)
library(gt)
library(broom)
library(ggplot2)

full_model <- lm(medv ~ ., data = data)
stepwise_model <- step(full_model, direction = "both")

multi_table = tbl_regression(stepwise_model) %>% add_global_p() %>%
  as_gt() %>%
  tab_caption("Table 2. Final Multivariate Regression Results After Variable Selection") %>%
  tab_source_note(md("Variables were selected using a stepwise selection method. Age and indus variables were removed from the selection method."))

saveRDS(multi_table, file = here::here("output/multi_table.rds"))
saveRDS(stepwise_model, file = here::here("output/step_result.rds"))
