library(testthat)
source('src/get_plots.R')

responses <- read.csv(file = "docs/survey_results_clean.csv")
plot_title <- "R or Python"

test_that("check if input is in correct format for function pie_chart",{
  
  expect_error(pie_chart('xyz', plot_title), 'data input should be of type data frame')
  expect_error(pie_chart(responses[,c(5,5)], 123), 'name input should be of type character')
  
})

test_that("check if input is in correct format for function bar_plot",{

  expect_error(bar_plot('xyz', plot_title), 'data input should be of type data frame')
  expect_error(bar_plot(responses[,c(5,5)], 123), 'name input should be of type character')
  
})


test_that("check if output is in correct format for pie_chart",{
  
  expect_true(is.list(pie_chart(responses[,c(5,5)], plot_title)))

})

test_that("check if output is in correct format for bar_plot",{
  
  expect_true(is.list(bar_plot(responses[,c(5,5)], plot_title)))
  
})


test_that("check if function pie_chart handles errors correctly",{
  
  expect_error(pie_chart(name = plot_title), 'argument "data" is missing, with no default')
  expect_error(pie_chart(data = responses[,c(5,5)]), 'argument "name" is missing, with no default')
  
})


test_that("check if function bar_plot handles errors correctly",{

  expect_error(bar_plot(name = plot_title), 'argument "data" is missing, with no default')
  expect_error(bar_plot(data = responses[,c(5,5)]), 'argument "name" is missing, with no default')
  
})