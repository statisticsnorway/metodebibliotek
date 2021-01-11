# Tests for functions imported from klassR

test_that("GetKlass returns a dataframe with correct codes", {
  region <- GetKlass(131, date = "2021-01-01")
  expect_true(is.data.frame(region))
  expect_equal(region$code[1], "0301")
})

test_that("GetKlass returns correct language", {
  yrke <- GetKlass(7, date = "2021-01-01", lang = "en")
  expect_equal(yrke$name[1], "Armed forces and unspecified")
  yrke <- GetKlass(7, date = "2021-01-01", lang = "nn")
  expect_equal(yrke$name[1], "Militære yrke og ikkje spesifisert")
})      
          
#test_that("GetKlass returns correct language", {
#  yrke <- c("1111", "1322")
#  yrke_expected <- c("Legislators", "Mining managers")
#  expect_equal(applyKlass(yrke), yrke_expected)
#})          

