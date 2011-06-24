context("Class check")

test_that("class is returned correctly", {
  expect_that(TRUE, is_true())
  expect_that(FALSE, is_false())
})
