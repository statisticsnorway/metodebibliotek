# Functions included in metodebibliotek from PxWebApiData package

#' Data Frame by PX-Web API
#' 
#' Wrappers of the function  \code{\link{ApiData}} in package PxWebApiData
#' 
#' The two functions \code{\link{ApiData}} and \code{\link{GetApiData}}
#' return two data frames each (label and id).
#' Four corresponding functions that return a single data frame are made.
#' 
#' 
#' @param ... Arguments to ApiData
#' 
#' @importFrom PxWebApiData ApiData GetApiData
#' @export
#' 
#' @examples
#' 
#' ##### Ordinary use
#' 
#' url4861en <- "https://data.ssb.no/api/v0/en/table/04861"
#' ApiData1(url4861en, Region = c("1103", "0301"), ContentsCode = 2, Tid = c(1, -1))
#' ApiData2(4861, Region = c("1103", "0301"), ContentsCode = "Bosatte", Tid = c(1, -1))
#' 
#' ##### Readymade dataset
#' 
#' url1066en <- "https://data.ssb.no/api/v0/dataset/1066.json?lang=en"
#' GetApiData1(url1066en)
#' GetApiData2(url1066en)
#'
ApiData1  <- function(...) {
  ApiData(...)[[1]]
}


#' @rdname ApiData1
#' @export
ApiData2  <- function(...) {
  ApiData(...)[[2]]
}


#' @rdname ApiData1
#' @export
GetApiData1  <- function(...) {
  GetApiData(...)[[1]]
}

#' @rdname ApiData1
#' @export
GetApiData2  <- function(...) {
  GetApiData(...)[[2]]
}