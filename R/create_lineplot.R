library(ggplot2)
library(dplyr)

#' Create a Line Plot
#'
#' Create a line plot using ggplot2 with specified data and labels.
#'
#' @param data The input data frame.
#' @param x_col The x-axis data column.
#' @param y_col The y-axis data column.
#' @param title The title for the plot.
#' @param x_label The label for the x-axis.
#' @param y_label The label for the y-axis.
#'
#' @return A ggplot2 line plot.
#'
#' @examples
#' exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
#' create_line_plot(exoplanets, disc_year, count, "Number of Exoplanet Discoveries Over Time", "Discovery Year", "Number of Discoveries")
#'
#' @export

create_line_plot <- function(data, x_col, y_col, title, x_label, y_label) {
  # Calculate the count of y_col for each x_col
  counts <- data %>%
    group_by({{x_col}}) %>%
    summarise(count = n())

  # Create a line plot
  ggplot(counts, aes(x = {{x_col}}, y = count)) +
    geom_line() +
    labs(title = title,
         x = x_label,
         y = y_label) +
    theme_minimal()
}

# Example usage:
# exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
# create_line_plot(exoplanets, disc_year, count, "Number of Exoplanet Discoveries Over Time", "Discovery Year", "Number of Discoveries")

