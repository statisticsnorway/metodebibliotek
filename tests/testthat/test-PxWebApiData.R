test_that("(ApiData1 and ApiData2 works", {
  a <- list(ApiData1(4861, Region = c("1103", "0301"), ContentsCode = "Bosatte", Tid = c(1, -1)),
            ApiData2(4861, Region = c("1103", "0301"), ContentsCode = "Bosatte", Tid = c(1, -1)))
  
  b <-      PxWebApiData::ApiData(4861, Region = c("1103", "0301"), ContentsCode = "Bosatte", Tid = c(1, -1))
  names(b) <- NULL
  comment(a[[1]]) <- NULL
  comment(a[[2]]) <- NULL
  expect_identical(a,b)    
})


test_that("GetApiData1 and GetApiData2 works", {
  url1066en <- "https://data.ssb.no/api/v0/dataset/1066.json?lang=en"
  GetApiData1(url1066en)
  GetApiData2(url1066en)
  a <- list(GetApiData1(url1066en), GetApiData2(url1066en))
  b <- PxWebApiData::GetApiData(url1066en)
  names(b) <- NULL
  comment(a[[1]]) <- NULL
  comment(a[[2]]) <- NULL
  expect_identical(a,b)    
})