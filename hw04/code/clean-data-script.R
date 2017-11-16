####################################################
# Title: 
# Description:
# Input(s):
# Output(s):
####################################################

# Source in functions to be used
source('functions.R')

# Load readr to read in CSV files
library(readr)

# Read in rawscores.csv
rawscores <- read_csv('../data/rawdata/rawscores.csv')

# Sinking structure of rawscores as well as summary statistics of
# each column in rawscores
sink('../output/summary-rawscores.txt')
str(rawscores)
print_stats(summary_stats(rawscores$HW1))
print_stats(summary_stats(rawscores$HW2))
print_stats(summary_stats(rawscores$HW3))
print_stats(summary_stats(rawscores$HW4))
print_stats(summary_stats(rawscores$HW5))
print_stats(summary_stats(rawscores$HW6))
print_stats(summary_stats(rawscores$HW7))
print_stats(summary_stats(rawscores$HW8))
print_stats(summary_stats(rawscores$HW9))
print_stats(summary_stats(rawscores$ATT))
print_stats(summary_stats(rawscores$QZ1))
print_stats(summary_stats(rawscores$QZ2))
print_stats(summary_stats(rawscores$QZ3))
print_stats(summary_stats(rawscores$QZ4))
print_stats(summary_stats(rawscores$EX1))
print_stats(summary_stats(rawscores$EX2))
sink()

# Replacing any NA values in columns of rawscores with 0
for (i in 1:ncol(rawscores)) {
  rawscores[,i][is.na(rawscores[,i])] <- 0
}

# Rescale QZ1
rawscores$QZ1 <- rescale100(rawscores$QZ1, 0, 12)

# Rescale QZ2
rawscores$QZ2 <- rescale100(rawscores$QZ2, 0, 18)

# Rescale QZ3
rawscores$QZ3 <- rescale100(rawscores$QZ3, 0, 20)

# Rescale QZ4
rawscores$QZ4 <- rescale100(rawscores$QZ4, 0, 20)

# Add columnt Test1 to rawscores that is comprised of
# the output from rescale100() on EX1
rawscores$Test1 <- rescale100(rawscores$EX1, 0, 80)

# Add columnt Test2 to rawscores that is comprised of
# the output from rescale100() on EX2
rawscores$Test2 <- rescale100(rawscores$EX2, 0, 90)

# Adding variable Homework to rawscores which is comprised
# of a single average value of the homework scores, with the lowest
# value dropped
hw <- c()
for (i in 1:nrow(rawscores)) {
  avg_hw <- score_homework(as.numeric(rawscores[i, 1:9]), TRUE)
  hw <- c(hw, avg_hw)
}
rawscores$Homework <- hw

# Adding variable Quiz to rawscores which is comprised
# of a single average value of the quiz scores, with the lowest
# value dropped
qz <- c()
for (i in 1:nrow(rawscores)) {
  avg_qz <- score_quiz(as.numeric(rawscores[i, 11:14]), TRUE)
  qz <- c(qz, avg_qz)
}
rawscores$Quiz <- qz

# Adding variable Lab to rawscores which is comprised
# of a student's lab score based on their attendance
lab <- c()
for (i in 1:nrow(rawscores)) {
  ls <- score_lab(as.numeric(rawscores[i, 10]))
  lab <- c(lab, ls)
}
rawscores$Lab <- lab

# Adding a variable Overall to rawscores which is comprised of values
# already in rawscores, but weighted according to the grading scale for the class
overall <- c()
for (i in 1:nrow(rawscores)) {
  rs <- (rawscores$Homework[i] * .3) + 
          (rawscores$Lab[i] * .1) +
          (rawscores$Quiz[i] * .15) +
          (rawscores$Test1[i] * .2) +
          (rawscores$Test2[i] * .25)
  overall <- c(overall, rs)
}
rawscores$Overall <- overall

# Add a variable Grade to rawscores that is determined
# based on a students overall score
grade <- c()
for (i in 1:nrow(rawscores)) {
  overall <- rawscores$Overall[i]
  print(overall)
  if (overall >= 0 & overall < 50) {
    grade <- c(grade, "F")
  } else if (overall >= 50 & overall < 60) {
    grade <- c(grade, "D")
  } else if (overall >= 60 & overall < 70) {
    grade <- c(grade, "C-")
  } else if (overall >= 70 & overall < 77.5) {
    grade <- c(grade, "C")
  } else if (overall >= 77.5 & overall < 79.5) {
    grade <- c(grade, "C+")
  } else if (overall >= 79.5 & overall < 82) {
    grade <- c(grade, "B-")
  } else if (overall >= 82 & overall < 86) {
    grade <- c(grade, "B")
  } else if (overall >= 86 & overall < 88) {
    grade <- c(grade, "B+")
  } else if (overall >= 88 & overall < 90) {
    grade <- c(grade, "A-")
  } else if (overall >= 90 & overall < 95) {
    grade <- c(grade, "A")
  } else if (overall >= 95 & overall <= 100) {
    grade <- c(grade, "A+")
  }
}
rawscores$Grade <- grade

# Sink the summary stats of Lab, Homework, Quiz, Test1, Test2, and Overall
file_names <- c("Lab-stats.txt", "Homework-stats.txt", "Quiz-stats.txt",
  "Test1-stats.txt", "Test2-stats.txt", "Overall-stats.txt")
data <- list(rawscores$Lab, rawscores$Homework, rawscores$Quiz,
  rawscores$Test1, rawscores$Test2, rawscores$Overall)
for (i in 1:length(file_names)) {
  print(file_names[i])
  print(data[i])
  sink(paste0('../output/', file_names[i]))
  print_stats(summary_stats(data[[i]]))
  sink()
}

# Sink structure of rawscores, which is now a dataframe of clean scores
sink('../output/summary-cleanscores.txt')
str(rawscores)
sink()

# Export rawscores, which is now a data frame of clean scores
# as a CSV file
write_csv(rawscores, path = '../data/cleandata/cleanscores.csv')
