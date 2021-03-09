
test_that("SmallCountData works", {
  expect_identical(dim(SmallCountData("e6")), c(6L, 4L))
})

test_that("PLSroundingPublish works", {
  z <- SmallCountData("e6")
  a <- PLSroundingPublish(z[, -2], "freq", hierarchies = SmallCountData("eHrc"))
  b <- PLSroundingPublish(z, "freq", formula = ~eu * year + geo * year)
  expect_identical(duplicated(rbind(a,b)), c(rep(FALSE, 18), rep(TRUE, 18)))
})

test_that("PLSroundingInner works", {
  z <- SmallCountData("e6")
  a <- PLSroundingInner(z[, -2], "freq", hierarchies = SmallCountData("eHrc"))
  b <- PLSroundingInner(z, "freq", formula = ~eu * year + geo * year)
  expect_identical(duplicated(rbind(a,b)), c(rep(FALSE, 6), rep(TRUE, 6)))
})