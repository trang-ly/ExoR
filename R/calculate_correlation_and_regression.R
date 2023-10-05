#' Calculate Correlation Coefficient and Linear Regression Model
#'
#' Calculate the correlation coefficient and linear regression between two variables.
#'
#' @param data The input data frame.
#' @param x_col The x-axis variable.
#' @param y_col The y-axis variable
#'
#' @return The correlation coefficient and linear regression model.
#'
#' @examples
#' exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
#' calculate_correlation_and_regression(exoplanets, "pl_radj", "st_rad")
#'
#' @export

calculate_correlation_and_regression <- function(data, x_var, y_var) {
  # Correlation Coefficient
  # Check if the variable names exist in the dataset
  if (!(x_var %in% names(data)) || !(y_var %in% names(data))) {
    stop("One or more variable names do not exist in the dataset.")
  }

  # Calculate the correlation coefficient, excluding missing values
  correlation_coefficient <- cor(data[[x_var]], data[[y_var]], use = "complete.obs")

  # Check if the correlation coefficient is not missing (NA)
  if (!is.na(correlation_coefficient)) {
    cat(paste("Correlation coefficient:", round(correlation_coefficient, 2), "\n"))
  } else {
    cat("Correlation coefficient could not be calculated due to missing or undefined values.\n")
  }

  # Linear Regression
  # Fit a linear regression model
  regression_model <- lm(data[[y_var]] ~ data[[x_var]])
  print(summary(regression_model))

  # Return the correlation coefficient and regression model
  return(list(correlation = correlation_coefficient, regression_model = regression_model))
}

# Example usage:
# exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
# calculate_correlation_and_regression(exoplanets, "pl_radj", "st_rad")
# calculate_correlation_and_regression(exoplanets, "pl_bmassj", "st_mass")


