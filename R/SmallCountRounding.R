# Functions included in metodebibliotek from SmallCountRounding package

#' @importFrom SmallCountRounding SmallCountData
#' @export
SmallCountRounding::SmallCountData


#' PLS inspired rounding - data frame output
#' 
#' A wrapper of the function  \code{\link{PLSrounding}} in package SmallCountRounding
#' with \code{publish} as the only output. 
#'  
#' 
#' @param data Input data as a data frame (inner cells)
#' @param ... Further arguments to PLSrounding
#' @return Data frame of publishable data with the main dimensional variables and with cell frequencies (original, rounded, difference).
#' 
#' @importFrom SmallCountRounding PLSrounding 
#' @export
#' 
#' @examples
#' z <- SmallCountData("e6")
#' PLSroundingPublish(z, "freq", roundBase = 5,  formula = ~geo + eu + year)
#' 
PLSroundingPublish <- function(data, ...) {
  PLSrounding(data, ...)$publish
}