here::i_am("code/02_make_figure.R")

library(gtsummary)
library(labelled)
library(gt)
library(broom)
library(ggplot2)

stepwise_model <- readRDS(
  here::here("output/step_result.rds")
)

model_results <- broom::tidy(stepwise_model)

coeff1=ggplot(model_results[1:5,], aes(x = term, y = estimate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_errorbar(aes(ymin = estimate - 1.96*std.error, ymax = estimate + 1.96*std.error), width = 0.2) +
  labs(
    title = "Multivariate Regression Coefficients",
    x = "Variables",
    y = "Estimate",
    caption = "Figure 1. Multivariate regression coefficients with error bars for first five variables."
  ) +scale_x_discrete(labels = c("(Intercept)" = "Intercept",
                                 "chas" = "Charles river",
                                 "crim" = "Crime rate",
                                 "nox" = "nitric oxides",
                                 "zn" = "proportion of residential land")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
    plot.caption = element_text(hjust = 0,size = 10))

saveRDS(coeff1, file = here::here("output/co_eff1.rds"))


coeff2 = ggplot(model_results[6:11,], aes(x = term, y = estimate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_errorbar(aes(ymin = estimate - 1.96*std.error, ymax = estimate + 1.96*std.error), width = 0.2) +
  labs(
    title = "Multivariate Regression Coefficients",
    x = "Variables",
    y = "Estimate",
    caption = "Figure 2. Multivariate regression coefficients with error bars for the remaining variables."
  ) +scale_x_discrete(labels = c("black" = "Black proportion",
                                 "dis" = "Weighted distances",
                                 "ptratio" = "Teacher ratio",
                                 "rad" = "Highway accessibility",
                                 "rm" = "Room numbers",
                                 "tax"="Property tax")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
    plot.caption = element_text(hjust = 0,size = 10))

saveRDS(coeff2, file = here::here("output/co_eff2.rds"))
