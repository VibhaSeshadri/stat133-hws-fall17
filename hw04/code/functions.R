########################################################
# Title: Functions
# Description: This file contains all of the functions
#             Which will be used in the tests.R,
#             tester-script.R, clean-data-script.R,
#             and gradevis.R to clean and use the data
#             of students scores 
# Input(s): Varies based on function. Specified in
#           docstring comments of functions. File
#           as a whole does not take in any singular 
#           input.
# Output(s): Varies based on function. Specified in 
#           docstring comments. File as a whole
#           does not give any singular ouput.
########################################################

# Loading library stringr to use in print_stats
library(stringr)

# Title: remove_missing
# Description: The function remove_missing takes in an input vector VEC
#             and returns VEC without missing values.
# Input: Numeric Vector with NAs
# Output: Numeric Vector with no NAs
remove_missing <- function(vec) {
  vec[!is.na(vec)]
}

# Title: get_minimum
# Description: The function get_minimum returns the minimum value 
#             in numeric vector VEC and removes NAs within VEC 
#             if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: Minimum value in numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_minimum <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  sort(vec)[1]
}

# Title: get_maximum
# Description: The function get_maximum returns the maximum value 
#               in numeric vector VEC and removes NAs within VEC 
#               if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: Maximum value in numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_maximum <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  sort(vec)[length(vec)]
}

# Title: get_range
# Description: The function get_range returns the difference between
#             the maximum and minimum value in numeric vector 
#             VEC and removes NAs within VEC if NA.RM = TRUE
#             for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: Range of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_range <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  get_maximum(vec, na.rm) - get_minimum(vec, na.rm)
}

# Title: get_percentile10
# Description: The function get_percentile10 returns the 10th
#             percentile of numeric vector VEC and removes NA within VEC
#             if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: 10th percentile value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_percentile10 <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  unname(quantile(vec, probs = 0.1, na.rm))
}

# Title: get_percentile90
# Description: The function get_percentile90 returns the 90th
#             percentile of numeric vector VEC and removes NA within VEC
#             if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: 90th percentile value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_percentile90 <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  unname(quantile(vec, probs = 0.9, na.rm))
}

# Title: get_median
# Description: The function get_median returns the median
#             of numeric vector VEC and removes NA within 
#             VEC if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: median value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_median <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  if (length(vec) %% 2 == 1) {
    sort(vec)[round(length(vec) / 2) + 1]
  } else {
    (sort(vec)[round(length(vec) / 2)] 
     + sort(vec)[round(length(vec) / 2) + 1]) / 2
  }
}

# Title: get_average
# Description: The function get_average returns the mean
#             of numeric vector VEC and removes NA within 
#             VEC if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: mean value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_average <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  sum <- 0
  for (i in 1:length(vec)) {
    sum <- sum + vec[i]
  }
  sum/length(vec)
}

# Title: get_stdev
# Description: The function get_stdev returns the stdev
#             of numeric vector VEC and removes NA within 
#             VEC if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: stdev value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_stdev <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(as.logical(NA))
  }
  sum <- 0
  avg <- get_average(vec)
  for (i in 1:length(vec)) {
    sum <- sum + (avg - vec[i]) ^ 2
  }
  sqrt(sum/(length(vec) - 1))
}

# Title: get_quartile1
# Description: The function get_quartile1 returns the first quartile
#             of numeric vector VEC and removes NA within 
#             VEC if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: first quartile value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_quartile1 <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  unname(quantile(vec, probs = 0.25, na.rm))
}

# Title: get_quartile3
# Description: The function get_quartile3 returns the third quartile
#             of numeric vector VEC and removes NA within 
#             VEC if NA.RM = TRUE for the purposes of this function.
# Input: Numeric vector and Logical TRUE or FALSE
# Output: third quartile value of numeric vector
#         or NA if vector contains NA and na.rm
#         is not TRUE.
get_quartile3 <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == TRUE) {
    vec <- remove_missing(vec)
  } else if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  unname(quantile(vec, probs = 0.75, na.rm))
}

# Title: count_missing
# Description: The function count_missing counts and returns
#             the number of missing elements (NA) in VEC
# Input: Numeric vector
# Output: numeric value of number of missing elements in VEC
count_missing <- function(vec) {
  num_na <- 0
  for (i in vec) {
    if (is.na(i)) {
      num_na <- num_na + 1
    }
  }
  num_na
}

# Title: summary_stats
# Description: The function summary_stats returns a list of all
#             the statistics which can be produced by the above
#             functions for a numeric vector VEC
# Input: Numeric vector
# Output: List of summary statistics for VEC
summary_stats <- function(vec) {
  list("minimum" = get_minimum(vec, TRUE),
       "percent10" = get_percentile10(vec, TRUE),
       "quartile1" = get_quartile1(vec, TRUE),
       "median" = get_median(vec, TRUE),
       "mean" = get_average(vec, TRUE),
       "quartile3" = get_quartile3(vec, TRUE),
       "percent90" = get_percentile90(vec, TRUE),
       "maximum" = get_maximum(vec, TRUE),
       "range" = get_range(vec, TRUE) ,
       "stdev" = get_stdev(vec, TRUE),
       "missing" = count_missing(vec))
}

# Title: print_stats
# Description: The function print_stats returns a nicely 
#             formatted string of all of the summary_stats
#             for the input list of summary stats LST 
# Input: List of summary statistics
# Output: Formatted string of summary statistics
print_stats <- function(lst) {
  for (i in 1:length(lst)) {
    hash <- "## "
    names <- names(lst)[i]
    gap_before <- paste0(rep(" ", 13 - nchar(names(lst)[i])), collapse = '')
    value <- sprintf("%.4f", lst[i])
    cat(noquote(paste0("## ", names, gap_before, ": ", value)), sep = "\n")
  }
}

# Title: rescale100
# Description: The function rescale100 takes in a numeric vector VEC
#             and a min value XMIN and max value XMAX and uses
#             these min and max boundaries to rescale the
#             inputs of VEC to be some number out of 100
# Input: Numeric vector, minimum value, maximum value
# Output: Numeric vector inputs scaled out of 100
rescale100 <- function(vec, xmin, xmax) {
  100 * ((vec - xmin) / (xmax - xmin))
}

# Title: drop_lowest
# Description: The function drop_lowest takes in a numeric vector
#             VEC and drops the lowest value in VEC
#             and returns a vector of length one less than VEC
# Input: Numeric vector
# Output: Numeric vector with lowest value dropped
drop_lowest <- function(vec) {
  vec <- sort(vec)
  vec[-1]
}

# Title: score_homework
# Description: The function score_homework returns the average score
#               of the numeric vector VEC passed in. If DROP = TRUE
#               the lowest value of VEC is removed before the average
#               score is computed.
# Input: Numeric vector and Logival value True and False
# Output: Average of numeric vector with with lowest value
#         dropped if drop = TRUE or just average of numeric vector
#         if drop = FALSE
score_homework <- function(vec, drop = FALSE) {
  if (drop == TRUE) {
    vec <- drop_lowest(vec)
  }
  get_average(vec)
}

# Title: score_quiz
# Description: The function score_quiz returns the average score
#               of the numeric vector VEC passed in. If DROP = TRUE
#               the lowest value of VEC is removed before the average
#               score is computed.
# Input: Numeric vector and Logival value True and False
# Output: Average of numeric vector with with lowest value
#         dropped if drop = TRUE or just average of numeric vector
#         if drop = FALSE
score_quiz <- function(vec, drop = FALSE) {
  if (drop == TRUE) {
    vec <- drop_lowest(vec)
  }
  get_average(vec)
}

# Title: score_lab
# Description: The function score_lab returns the lab score corresponding
#             to the numeric input indicating the student's lab 
#             ATTENDANCE
# Input: Numeric value out of 12
# Output: Numeric value out of 100
score_lab <- function(attendance) {
  switch(as.character(attendance),
         "12" = 100,
         "11" = 100,
         "10" = 80,
         "9" = 60,
         "8" = 40,
         "7" = 20,
         0)
}