###########################################################
# Title: Unit Test Runner
# Description: Executes all unit tests written in Tests.R
# Input(s): Location and File you want to sink unit test
#           ouput to, as well as the source of functions
#           you are testing and the unit test file.
# Output(s): Text file test-reporter.txt
##########################################################

# test script
library(testthat)

# source in functions to be tested
source('functions.R')

sink('../output/test-reporter.txt')
test_file('tests.R')
sink()
