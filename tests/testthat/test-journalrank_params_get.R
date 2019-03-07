context("test-journalrank_params_get")

test_that("journalrank_params_get returns correct data", {
  params <- journalrank_params_get()

  expect_s3_class(params, journalrank_params)
  expect_type(params, "list")
  expect_type(params$SJR, "list")
  expect_type(params$SCOPUS, "list")
  expect_type(params$INCITE, "list")

  expect_equal(length(params$SJR), 2)
  expect_equal(length(params$SCOPUS), 2)
  expect_equal(length(params$INCITE), 2)
})
