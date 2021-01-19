
set.seed(1234)
z <- AkuData(100)
zPop <- AkuData(200)[, 1:7]
z$samplingWeights <- sample(10000:100000, NROW(z))
z$sex <- as.character(z$sex)
zPop$age <- as.character(zPop$age)


test_that("AkuData works", {
  expect_identical(dim(z), c(800L, 12L))
})


test_that("CalibrateSSBweights works", {
  a <- CalibrateSSBweights(z, calmodel = "~ sex*age", partition = c("year", "q"), popData = zPop, 
                           samplingWeights = "samplingWeights")
  revind <- rev(seq_len(nrow(z)))
  b <- CalibrateSSBweights(z[revind, ], calmodel = "~ age*sex", partition = c("q", "year"), 
                           usePackage = "none", popData = zPop, samplingWeights = "samplingWeights")
  expect_equal(a$calWeights, rev(b$calWeights))
})



test_that("CalibrateSSBpanel2 works", {
  lc <- rbind(CalibrateSSB::LagDiff(8, 4), CalibrateSSB::PeriodDiff(8, 4))
  rownames(lc) <- c("diffQ1", "diffQ2", "diffQ3", "diffQ4", "diffYearMean")
  a <- CalibrateSSBpanel2(data = z, calmodel = "~ sex*age", partition = c("year", "q"), 
                          popData = zPop, y = c("unemployed", "workforce"), id = "id", 
                          wave = c("year", "q"), numerator = "unemployed", linComb = lc)
  expect_equal(sum(sqrt(abs(a$value))), 146.842154059373)
})


