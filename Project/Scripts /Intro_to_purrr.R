nums <- c(1.1234, 2.535, 3.784, 5.665)

# Default behavior of map is to return a list. 
nums_rounded <- map(nums, round, digits = 2)

# Or Equivalently: 
nums_rounded1 <- map_dbl(nums, ~ .)

# There are many other map* variations in the map familiy: 
# E.g., 

nums_times_two2 <- map_int(nums, ~.x *2)
nums_times_two2

## Mapping and Nesting 
names <- sample(c("Anna", "Carl", "Peter"), 30, replace = TRUE)
data <- data.frame(
  x = round(rnorm(30,14,3),1),
  y = round(rnorm(30,14,3),1),
  names = names
)

## Use nesting to calculate the mean and standard deviation, and max for Anna, Carl and Peter. 
calc_stats <- function (df) {
  df |> 
    summarise( 
            mean_x = mean(x, na.rm = TRUE),
            st_dv_x = sd(x, na.rm = TRUE),
            mean_y = mean(y, na.rm = TRUE),
            st_dv_y = sd(y, na.rm = TRUE)
            )
}

name_stats <- data |> 
  group_by(names) |> 
  nest() |> 
  mutate(stats = map(data, calc_stats)) |> 
  select(names, stats) |> 
  unnest(stats)
name_stats


















