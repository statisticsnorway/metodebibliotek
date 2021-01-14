# Functions included in metodebibliotek from easySdcTable package

#' @importFrom easySdcTable EasyData
#' @export
easySdcTable::EasyData


#' Table suppression according to a frequency rule 
#' 
#' A wrapper of the function  \code{\link{ProtectTable}} in package easySdcTable 
#' 
#' @param data data frame
#' @param ... Further arguments to ProtectTable
#' @return Data set output from ProtectTable
#' 
#' @importFrom easySdcTable ProtectTable PTwrap
#' @export
#' 
#' @examples
#' 
#' z1 <- EasyData("z1") 
#' ProtectTableData(z1, c("region","hovedint"), "ant",  method="SIMPLEHEURISTIC")
#'
#' z1w <- EasyData("z1w") 
#' ProtectTableData(z1w, 1, 2:5)    
ProtectTableData <- function(data, ...) {
  ProtectTable(data, ..., singleOutput = TRUE)$data
}




#' @importFrom Kostra ProtectKostra
#' @export
Kostra::ProtectKostra


