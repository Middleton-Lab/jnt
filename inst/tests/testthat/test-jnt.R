library("testthat")
library("jnt")
library("covr")

# shine(package_coverage(type = "all"))

context("Check jnt()")

set.seed(1234)

n <- 50

x1 <- rnorm(n)
y1 <- x1 + rnorm(n, sd = 0.2)

x2 <- rnorm(n)
y2 <- 1.25 * x2 + rnorm(n, sd = 0.2)

df1 <- data.frame(x = x1, y = y1)
df2 <- data.frame(x = x2, y = y2)

test_that("Use of silent in jnt", {
  expect_message(jnt(df1, df2, use_sma = TRUE, silent = FALSE))
  expect_silent(jnt(df1, df2, use_sma = TRUE, silent = TRUE))
})
