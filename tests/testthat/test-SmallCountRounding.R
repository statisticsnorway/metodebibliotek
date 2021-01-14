
test_that("SmallCountData works", {
  expect_identical(dim(SmallCountData("e6")), c(6L, 4L))
})

test_that("PLSroundingPublish works", {
  z <- SmallCountData("e6")
  set.seed(12345)
  a <- PLSroundingPublish(z[, -2], "freq", hierarchies = SmallCountData("eHrc"))
  set.seed(12345)
  b <- PLSroundingPublish(z, "freq", formula = ~eu * year + geo * year)
  expect_identical(duplicated(rbind(a,b)), c(rep(FALSE, 18), rep(TRUE, 18)))
})