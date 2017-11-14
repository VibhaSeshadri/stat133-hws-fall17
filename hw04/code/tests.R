####################################################
# Title: 
# Description:
# Input(s):
# Output(s):
####################################################

# Load library 'testthat' to help with writing unit tests
library(testthat)

# Unit test for remove_missing to ensure that NA values
# in vectors passed in are being removed
context("testing remove_missing()")
test_that("NA values are removed from vector", {
expect_equal(remove_missing(c(1, 2, 3, NA, 5)), c(1, 2, 3, 5))
expect_equal(remove_missing(c("one", "two", "stop here", NA)),
             c("one", "two", "stop here"))
expect_equal(remove_missing(c(TRUE, FALSE, NA)), c(TRUE, FALSE))
expect_equal(remove_missing(c(NA, NA, NA)), logical(0))
})

# Unit test for get_minimum to ensure that minimum value
# is returned and NAs are removed when specified
context("testing get_minimum")
test_that("minimum is returned and NA value removed when specified", {
  expect_equal(get_minimum(c(4, 3, 1, 2)), 1)
  expect_equal(get_minimum(c(0, 0, 0, 0)), 0)
  with_na <- c(NA, NA, 1, 2, 3)
  expect_equal(get_minimum(with_na), NA)
  expect_equal(get_minimum(with_na, TRUE), 1)
})

# Unit test for get_maximum to ensure that maximum value
# is returned and NAs are removed when specified
context("testing get_maximum")
test_that("maximum is returned and NA value removed when specified", {
  expect_equal(get_maximum(c(4, 3, 1, 2)), 4)
  expect_equal(get_maximum(c(0, 0, 0, 0)), 0)
  with_na <- c(NA, NA, 1, 2, 3)
  expect_equal(get_maximum(with_na), NA)
  expect_equal(get_maximum(with_na, TRUE), 3)
})

# Unit test for get_range to ensure that difference between 
# maximum and minimum in a vector is returned
# NAs are removed when specified
context("testing get_range")
test_that("proper range is returned and NAs are removed when specified", {
  expect_equal(get_range(c(4, 3, 1, 2)), 3)
  expect_equal(get_range(c(0, 0, 0, 0)), 0)
  with_na <- c(NA, NA, 1, 2, 3)
  expect_equal(get_range(with_na), NA)
  expect_equal(get_range(with_na, TRUE), 2)
})

# Unit test for get_percentile10 to ensure that 10th percentile of
# input vector is returned and NAs are removed when specified
context("testing get_percentile10")
test_that("10th percentile is returned and NAs are removed when specified", {
  expect_equal(get_percentile10(c(4, 3, 1, 2)), 1.3)
  expect_equal(get_percentile10(c(0, 0, 0, 0)), 0)
  with_na <- c(NA, NA, 1, 2, 3)
  expect_equal(get_percentile10(with_na), NA)
  expect_equal(get_percentile10(with_na, TRUE), 1.2)
})

# Unit test for get_percentile90 to ensure that 90th percentile of
# input vector is returned and NAs are removed when specified
context("testing get_percentile90")
test_that("90th percentile is returned and NAs are removed when specified", {
  expect_equal(get_percentile90(c(4, 3, 1, 2)), 3.7)
  expect_equal(get_percentile90(c(0, 0, 0, 0)), 0)
  with_na <- c(NA, NA, 1, 2, 3)
  expect_equal(get_percentile90(with_na), NA)
  expect_equal(get_percentile90(with_na, TRUE), 2.8)
})

# Unit test for get_median to ensure that median value in
# input vector is returned and NAs are removed when specified
context("testing get_median")
test_that("median is returned and NAs are removed when specified", {
  expect_equal(get_median(c(5, 4, 3, 2, 1)), median(c(5, 4, 3, 2, 1)))
  expect_equal(get_median(c(4, 3, 2, 1)), median(c(4, 3, 2, 1)))
  expect_equal(get_median(c(5, 4, 3, 2, 1, NA)), NA)
  expect_equal(get_median(c(5, 4, 3, 2, 1, NA), TRUE), 
               median(c(5, 4, 3, 2, 1)))
  expect_equal(get_median(c(4, 3, 2, 1, NA), TRUE), median(c(4, 3, 2, 1)))
})

# Unit test for get_average to ensure that mean value in
# input vector is returned and NAs are removed when specified
context("testing get_average")
test_that("mean is returned and NAs are removed when specified", {
  expect_equal(get_average(c(6, 4, 2, 0, -2)), mean(c(6, 4, 2, 0, -2)))
  expect_equal(get_average(c(6, 4, 2, 0)), mean(c(6, 4, 2, 0)))
  expect_equal(get_average(c(6, 4, 2, 0, -2, NA)), NA)
  expect_equal(get_average(c(6, 4, 2, 0, -2, NA), TRUE), mean(c(6, 4, 2, 0, -2)))
  expect_equal(get_average(c(6, 4, 2, 0, NA), TRUE), mean(c(6, 4, 2, 0)))
})

# Unit test for get_stdev to ensure that stdev value of
# input vector is returned and NAs are removed when specified
context("testing get_stdev")
test_that("stdev is returned and NAs are removed when specified", {
  expect_equal(get_stdev(c(6, 4, 2, 0, -2)), sd(c(6, 4, 2, 0, -2)))
  expect_equal(get_stdev(c(6, 4, 2, 0)), sd(c(6, 4, 2, 0)))
  expect_equal(get_stdev(c(6, 4, 2, 0, -2, NA)), NA)
  expect_equal(get_stdev(c(6, 4, 2, 0, -2, NA), TRUE), sd(c(6, 4, 2, 0, -2)))
  expect_equal(get_stdev(c(6, 4, 2, 0, NA), TRUE), sd(c(6, 4, 2, 0)))
})

# Unit test for get_quartile3 to ensure that the third quartile of
# input vector is returned and NAs are removed when specified
context("testing get_quartile3")
test_that("quartile 3 is returned and NAs are removed when specified", {
  expect_equal(get_quartile3(c(4, 3, 1, 2)), 3.25)
  expect_equal(get_quartile3(c(0, 0, 0, 0)), 0)
  with_na <- c(NA, NA, 1, 2, 3)
  expect_equal(get_quartile3(with_na), NA)
  expect_equal(get_quartile3(with_na, TRUE), 2.5)
})

# Unit test for count_missing to ensure that the correct number
# of NA in the input vector are counted.
context("testing count_missing")
test_that("count_missing returns the correct number of NAs in input vector", {
  expect_equal(count_missing(c(1, 2, 3, 4)), 0)
  expect_equal(count_missing(c(NA, NA, NA, NA)), 4)
  expect_equal(count_missing(c("4", 5, TRUE, NA, NA)), 2)
  expect_equal(count_missing(c()), 0)
})

# Unit test for summary_stat to ensure that the correct statistics
# are being returned for the input vector
context("testing summary_stats")
test_that("summary_stats returns the correct value", {
  vec <- c(1, 2, 3, 4, 5, NA)
  expect_equal(summary_stats(vec)$range, 4)
  expect_equal(summary_stats(vec)$missing, 1)
  expect_equal(summary_stats(vec)$median, 3)
  expect_equal(summary_stats(vec)$average, 3)
})
