####################################################
# Title: 
# Description:
# Input(s):
# Output(s):
####################################################

# The function remove_missing takes in input vector VEC
# and returns VEC without missing values.
remove_missing <- function(vec) {
  vec[!is.na(vec)]
}

# The function get_minimum returns the minimum value in VEC
# and removes NAs within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_maximum returns the maximum value in VEC
# and removes NAs within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_range returns the difference between
# the maximum and minimum value in VEC and removes
# NAs within VEC if NA.RM = TRUE
# for the purposes of this function.
get_range <- function(vec, na.rm = FALSE) {
  if (!is.numeric(vec)) {
    stop("non-numeric argument")
  }
  if (na.rm == FALSE & any(is.na(vec))) {
    return(NA)
  }
  get_maximum(vec, na.rm) - get_minimum(vec, na.rm)
}

# The function get_percentile10 returns the 10th
# percentile of VEC and removes NA within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_percentile90 returns the 90th
# percentile of VEC and removes NA  within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_median returns the median
# of VEC and removes NA within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_average returns the mean
# of VEC and removes NA within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_stdev returns the stdev
# of VEC and removes NA within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_quartile1 returns the first
# quartile of VEC and removes NA  within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function get_quartile3 returns the third
# quartile of VEC and removes NA  within VEC if NA.RM = TRUE
# for the purposes of this function.
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

# The function count_missing counts and returns
# the number of missing elements (NA) in VEC
count_missing <- function(vec) {
  num_na <- 0
  for (i in vec) {
    if (is.na(i)) {
      num_na <- num_na + 1
    }
  }
  num_na
}

# The function summary_stats returns a list of all
# the statistics which can be produced by the above
# functions for a vector VEC
summary_stats <- function(vec) {
  list("minimum" = get_minimum(vec, TRUE), 
       "maximum" = get_maximum(vec, TRUE),
       "range" = get_range(vec, TRUE) ,
       "percentile10" = get_percentile10(vec, TRUE),
       "percentile90" = get_percentile90(vec, TRUE),
       "median" = get_median(vec, TRUE),
       "average" = get_average(vec, TRUE),
       "stdev" = get_stdev(vec, TRUE),
       "quartile1" = get_quartile1(vec, TRUE),
       "quartile3" = get_quartile3(vec, TRUE),
       "missing" = count_missing(vec))
}

# The function print_stats returns a nicely 
# formatted string of all of the summary_stats
# for the input vector VEC
print_stats <- function(lst) {
  str <- cat(sprintf(" ## %s : %.4f", 
                names(lst)[1], lst[1]), sep = "\n")
  for (i in 2:length(lst)) {
    if (i != length(lst)) {
      str <- cat(paste(str, sprintf("## %s : %.4f", 
                                names(lst)[i], lst[i])), 
                                sep = "\n")
    } else {
      str <- cat(paste(str, sprintf("## %s : %.4f", 
                                    names(lst)[i], lst[i])))
    }
  }
  str
}
