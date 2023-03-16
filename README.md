# ARM-R-intro
**Introductory R workshop for Advanced Research Methods students (created Spring 2023)**

*16 March 2023 - Grace Handley*

*Class: Advanced Research Methods*

*R Basics & Cycle 1: Food Stroop*

## R BASICS

Work through R basics first: Steps 1-3 of [this tutorial](https://www.jcu.edu.au/__data/assets/pdf_file/0004/1188310/R-Studio-Basics.pdf)

## CYCLE 1: Analyzing Food Stroop data

### Food Stroop description:
Our class ran an alternative Stroop task in which the stimulus words were food items that were strongly associated with certain colors (i.e., tomato, lemon, carrot, and broccoli instead of red, yellow, orange, and green, respectively). The goal of this R workshop is to import these data, prepare them for analysis, and analyze them. 

### Questions before getting started with data analysis:
1. What kind of experimental design are we using in this study?
2. What is/are our dependent variable(s)?
3. What is/are our independent variable(s)?
4. What are our hypotheses? Remember: we have a null hypothesis and an alternative hypothesis for each DV. Write down both of them.
5. Given our design, what kind of statistical test can we use to test our hypotheses?

### Data file description:
We are using the summary data from Inquisit. These data are saved in foodstroopsummary.csv and the data file is aggregated by participant (i.e., each participant's data is represented by one row). Here are the variables we will be using:
- **subjectid**: the participant's unique identifier
- **propcorrect**: the proportion of *all* trials on which the participant responded correctly (collapsed across congruent, incongruent, and control trials)
- **meanRT**: participant's average overall response time across *all* trials (collapsed across congruent, incongruent, and control trials)
- **propcorrect_congruent**: the proportion of *congruent* trials on which the participant responded correctly
- **propcorrect_incongruent**: the proportion of *incongruent* trials on which the participant responded correctly
- **meanRTcorr_congruent**: participant's average response time across *congruent* trials on which they responded correctly
- **meanRTcorr_incongruent**: participant's average response time across *incongruent* trials on which they responded correctly

### Steps for importing, preparing, and analyzing our data:
0. Set our working directory with `setwd()`
1. Import our data with `read.csv`
2. Plot simple histograms of each DV
3. Log transform the RT DV
4. Run the appropriate statistical test for the accuracy DV
5. Run the appropriate statistical test for the log-transformed RT DV
6. Plot the results of both tests
7. Save our results
