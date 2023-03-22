setwd("/Users/gracehandley/Documents/Teaching/S23 TA ARM /StroopWorkshop/ARM_Pilot")

library(tidyverse)

data <- read.csv("data.csv", header = TRUE, sep = ",")
data.long <- gather(data, color, rating, cherry:peanut, factor_key = TRUE)

missing <- is.na(data.long$rating)
sum(missing)

data.long.clean <- subset(data.long, subset = !missing)

agg.data <- data.long.clean %>% group_by(color) %>% 
  summarise(mean_rating=mean(rating))
View(agg.data)

agg.df <- as.data.frame(agg.data)

agg.df$group <- c("red", "red", "red", "red", "red", "red", "red", "red",
                  "yellow", "yellow", "yellow", "yellow", "yellow", "yellow", 
                  "green", "green", "green", "green", "green", "green", "green", "green", "green", "green", "green", "green", 
                  "orange", "orange", "orange", "orange", "orange", 
                  "purple", "purple", "purple", "purple",
                  "white", "white", "white", "white", "white", "white", "white", "white", 
                  "brown", "brown", "brown", "brown")

# get the means for each color group; use the colors with the highest average rating
agg.df %>%
  group_by(group) %>%
  summarise_at(vars(mean_rating), list(sd = sd)) %>%
  arrange(desc(sd))

# # A tibble: 7 × 2
# group   mean
# <chr>  <dbl>
# 1 green   6.32
# 2 red     6.23
# 3 yellow  6.20
# 4 orange  6.03
# 5 white   5.88
# 6 brown   5.67
# 7 purple  5.42
# >

# Find the top rated colors within each top-rated group: GREEN
agg.df %>% 
  filter(group=="green") %>%
  group_by(color) %>%
  summarise_at(vars(mean_rating), list(mean = mean)) %>%
  arrange(desc(mean))

# # A tibble: 12 × 2
# color      mean
# <fct>     <dbl>
# 1 spinach    6.90
# 2 broccoli   6.76
# 3 cucumber   6.76
# 4 pea        6.67
# 5 asparagus  6.57
# 6 celery     6.38
# 7 kale       6.38
# 8 avo1       6.33
# 9 lettuce    6.24
# 10 kiwi       6.10
# 11 zucchini   5.75
# 12 cabbage    5   

# Find the top rated colors within each top-rated group: RED
agg.df %>% 
  filter(group=="red") %>%
  group_by(color) %>%
  summarise_at(vars(mean_rating), list(mean = mean)) %>%
  arrange(desc(mean))

# # A tibble: 8 × 2
# color        mean
# <fct>       <dbl>
# 1 tomato       7   
# 2 ketchup      6.81
# 3 strawberry   6.67
# 4 cherry       6.52
# 5 cranberry    6.25
# 6 rasberry     6   
# 7 apple        5.62
# 8 pomegranate  4.95

# Find the top rated colors within each top-rated group: YELLOW
agg.df %>% 
  filter(group=="yellow") %>%
  group_by(color) %>%
  summarise_at(vars(mean_rating), list(mean = mean)) %>%
  arrange(desc(mean))

# # A tibble: 6 × 2
# color      mean
# <fct>     <dbl>
# 1 lemon      7   
# 2 banana     6.71
# 3 corn       6.62
# 4 pineapple  6.29
# 5 mustard    5.76
# 6 butter     4.81

# Find the top rated colors within each top-rated group: ORANGE
agg.df %>% 
  filter(group=="orange") %>%
  group_by(color) %>%
  summarise_at(vars(mean_rating), list(mean = mean)) %>%
  arrange(desc(mean))

# # A tibble: 5 × 2
# color       mean
# <fct>      <dbl>
# 1 carrot      6.67
# 2 clementine  6.43
# 3 pumpkin     6.38
# 4 cheetos     6.24
# 5 mango       4.43
