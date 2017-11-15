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
test_that("summary_stats returns correct stats", {
  vec <- c(1, 2, 3, 4, 5, NA)
  expect_equal(summary_stats(vec)$range, 4)
  expect_equal(summary_stats(vec)$missing, 1)
  expect_equal(summary_stats(vec)$median, 3)
  expect_equal(summary_stats(vec)$average, 3)
})

# Unit test for print_stats to ensure that summary statistics
# are being printed in the proper format.
context("testing print_stats")
test_that("print_stats prints in proper format", {
  #WRITE TESTS HERE VIBHA OKKKKKKKK
})

# Unit test for rescale100 to ensure that all vectors
# in an input vector are properly rescaled out of 100
# based on the min and max given in arguments to function.
context("testing rescale100")
test_that("rescale100 rescales vector properly", {
  normal <- c(1, 2, 3, 4, 5)
  varied <- c(15, 30, 25, 50)
  unanimous <- c(0, 0, 0, 0)
  expect_equal(rescale100(normal, 0, 10), c(10, 20, 30, 40, 50))
  expect_equal(rescale100(varied, 0, 50), c(30, 60, 50, 100))
  expect_equal(rescale100(unanimous, 0, 13), c(0, 0, 0, 0))
  expect_equal(rescale100(normal, 2, 4), c(-50, 0, 50, 100, 150))
})

# Unit test for drop_lowest to ensure that the smallest
# value in a vector is dropped from a vector
context("testing drop_lowest")
test_that("drop_lowest actually drops the smallest value from a vector", {
  expect_equal(drop_lowest(c(1, 2, 3)), c(2, 3))
  expect_equal(drop_lowest(c(0, 0, 0)), c(0, 0))
  expect_equal(drop_lowest(c(-150, 120, 40, 0)), c(120, 40, 0))
  expect_equal(drop_lowest(c(2.9, 3, 4)), c(3, 4))
})

# Unit test for score_homework to ensure that the correct average
# for a vector of homework scores is returned.
context("testing score_homework")
test_that("score_homework returns correct average 
          when drop is and isnt true", {
            expect_equal(score_homework(c(1, 2, 3, 4)), 2.5)
            expect_equal(score_homework(c(1, 2, 3, 4), TRUE), 3)
            expect_equal(score_homework(c(100, 100)), 100)
            expect_equal(score_homework(c(100, 100), TRUE), 100)
})

# Unit test for score_quiz to ensure that the correct average
# for a vector of quiz scores is returned.
context("testing score_quiz")
test_that("score_quiz returns correct average 
          when drop is and isnt true", {
            expect_equal(score_quiz(c(1, 2, 3, 4)), 2.5)
            expect_equal(score_quiz(c(1, 2, 3, 4), TRUE), 3)
            expect_equal(score_quiz(c(100, 100)), 100)
            expect_equal(score_quiz(c(100, 100), TRUE), 100)
            })

# Unit test for score_lab to ensure that correct corresponding
# lab score is returned based on attendance input passed in
context("testing score_lab")
test_that("score_lab returns correct lab score", {
  expect_equal(score_lab(12), 100)
  expect_equal(score_lab(11), 100)
  expect_equal(score_lab(6), 0)
  expect_equal(score_lab(5), 0)
  expect_equal(score_lab(9), 60)
})
