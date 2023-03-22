# 16 March 2023 - Grace Handley
# Class: Advanced Research Methods
# R Basics & Cycle 1: Food Stroop

##### IMPORT AND CLEAN DATA #####
# Import our data with read.csv
setwd("/Users/gracehandley/Desktop/ARM3_16_23/")
data <- read.csv("foodstroopsummary.csv", header=TRUE, sep=",")

# Remove missing data 
data.clean <- na.omit(data)

##### EXPLORE THE DATA SET #####
# Check that are variables are numeric
class(data.clean[,"propcorrect"])
class(data.clean[,"meanRT"])

class(data.clean[,"propcorrect_congruent"])
class(data.clean[,"propcorrect_incongruent"])

class(data.clean[,"meanRTcorr_congruent"])
class(data.clean[,"meanRTcorr_incongruent"])

# Plot histogram of each OVERALL DV
hist(data.clean$propcorrect,
     main = "Histogram of Overall Proportion Correct",
     xlab = "Proportion Correct")
hist(data.clean$meanRT,
     main = "Histogram of Overall Mean Reaction Time (RT)",
     xlab = "Mean RT")

##### PAIRED SAMPLES T-TESTS #####
# t-test for accuracy DV
t.test(data.clean$propcorrect_congruent, data.clean$propcorrect_incongruent, 
       paired = TRUE, 
       alternative = "two.sided")

# t-test for RT DV
t.test(data.clean$meanRTcorr_congruent, data.clean$meanRTcorr_incongruent,
       paired = TRUE,
       alternative = "two.sided")

##### PLOTTING RESULTS #####
# First, install ggpubr using install.packages("ggpubr") in the console if it's the first time you're using this package
# Then, load ggpubr:
library(ggpubr)

# Plot the accuracy t-test results
ggpaired(data.clean, 
         cond1      = "propcorrect_congruent", 
         cond2      = "propcorrect_incongruent",
         color      = "condition", 
         line.color = "gray", 
         line.size  = 0.4,
         palette    = "npg")

# And finally plot the RT t-test results
ggpaired(data.clean, 
         cond1      = "meanRTcorr_congruent", 
         cond2      = "meanRTcorr_incongruent",
         color      = "condition", 
         line.color = "gray", 
         line.size  = 0.4,
         palette    = "npg")
         
