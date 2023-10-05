library(ggplot2)
library(dplyr)

#' Create a Bar Plot
#'
#' Create a bar plot using ggplot2 with specified data and labels.
#'
#' @param data The input data frame.
#' @param x_col The x-axis data column.
#' @param y_col The y-axis data column.
#' @param title The title for the plot.
#' @param x_label The label for the x-axis.
#' @param y_label The label for the y-axis.
#'
#' @return A ggplot2 bar plot.
#'
#' @examples
#' exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
#' create_barplot(exoplanets, discoverymethod, count, "Exoplanet Discoveries by Discovery Method", "Discovery Method", "Number of Discoveries")
#'
#' @export

create_barplot <- function(data, x_col, y_col, title, x_label, y_label) {
  # Calculate the count of y_col for each x_col
  counts <- data %>%
    group_by({{x_col}}) %>%
    summarise(count = n())

  # Sort the data by count in descending order
  counts <- counts %>%
    arrange(desc(count))

  # Reorder the x_col column by count in descending order
  x_col_ordered <- reorder(counts %>% pull({{x_col}}), -counts$count)

  # Create a vertical bar plot using ggplot2 with rainbow colors and labels
  plot <- ggplot(counts, aes(x = x_col_ordered, y = count, fill = x_col_ordered)) +
    geom_bar(stat = "identity") +
    geom_text(aes(label = count), vjust = -0.5, size = 3) + # Add labels
    labs(title = title,
         x = x_label,
         y = y_label) +
    scale_fill_manual(values = rainbow(nrow(counts))) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(legend.position = "none") # Hide the legend

  return(plot)
}

# Example usage:
# exoplanets <- read.csv("PS_2023.10.04_12.36.20.csv", skip = 290)
# create_barplot(exoplanets, discoverymethod, count, "Exoplanet Discoveries by Discovery Method", "Discovery Method", "Number of Discoveries")
# create_barplot(exoplanets, disc_year, count, "Exoplanet Discoveries by Year", "Discovery Year", "Number of Discoveries")
