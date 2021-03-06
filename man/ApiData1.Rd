% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PxWebApiData.R
\name{ApiData1}
\alias{ApiData1}
\alias{ApiData2}
\alias{GetApiData1}
\alias{GetApiData2}
\title{Data Frame by PX-Web API}
\usage{
ApiData1(...)

ApiData2(...)

GetApiData1(...)

GetApiData2(...)
}
\arguments{
\item{...}{Arguments to ApiData}
}
\description{
Wrappers of the function  \code{\link{ApiData}} in package PxWebApiData
}
\details{
The two functions \code{\link{ApiData}} and \code{\link{GetApiData}}
return two data frames each (label and id).
Four corresponding functions that return a single data frame are made.
}
\examples{

##### Ordinary use

url4861en <- "https://data.ssb.no/api/v0/en/table/04861"
ApiData1(url4861en, Region = c("1103", "0301"), ContentsCode = 2, Tid = c(1, -1))
ApiData2(4861, Region = c("1103", "0301"), ContentsCode = "Bosatte", Tid = c(1, -1))

##### Readymade dataset

url1066en <- "https://data.ssb.no/api/v0/dataset/1066.json?lang=en"
GetApiData1(url1066en)
GetApiData2(url1066en)

}
