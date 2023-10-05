library(ggplot2)
library(dplyr)

#' Create a Scatter Plot
#'
#' Create a scatter plot using ggplot2 with specified data and labels.
#'
#' @param data The input data frame.
#' @param x_col The x-axis data column.
#' @param y_col The y-axis data column.
#' @param title The title for the plot.
#' @param x_label The label for the x-axis.
#' @param y_label The label for the y-axis.
#'
#' @return A ggplot2 scatter plot.
#'
#' @examples
#' exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
#' create_scatterplot(exoplanets, pl_radj, st_rad, "Comparison of Planet Radius and Host Star Radius", "Planet Radius (in Jupiter Radii)", "Host Star Radius (in Solar Radii)", y_max_limit = 6)
#'
#' @export

create_scatterplot <- function(data, x_col, y_col, title, x_label, y_label, y_max_limit = NULL) {
  # Create a scatter plot using ggplot2 with labels
  plot <- ggplot(data, aes(x = {{x_col}}, y = {{y_col}})) +
    geom_point(color = "blue") +
    labs(title = title,
         x = x_label,
         y = y_label) +
    theme_minimal()

  # Set the y-axis limit if provided
  if (!is.null(y_max_limit)) {
    plot <- plot + ylim(0, y_max_limit)
  }

  return(plot)
}

# Example usage:
# exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
# create_scatterplot(exoplanets, pl_radj, st_rad, "Comparison of Planet Radius and Host Star Radius", "Planet Radius (in Jupiter Radii)", "Host Star Radius (in Solar Radii)", y_max_limit = 6)
# create_scatterplot(exoplanets, pl_bmassj, st_mass, "Comparison of Planet Mass and Host Star Mass", "Planet Mass (in Jupiter Mass)", "Host Star Mass (in Solar Mass)")
