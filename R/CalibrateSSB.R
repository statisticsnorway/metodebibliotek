# Functions included in metodebibliotek from CalibrateSSB package


#' @importFrom CalibrateSSB AkuData
#' @export
CalibrateSSB::AkuData


#' Calibration weighting 
#' 
#' A wrapper of the function  \code{\link{CalibrateSSB}}
#' 
#' @param data The gross sample data frame
#' @param ... Further arguments to CalibrateSSB
#' @param weightsname Name of variable with output weights 
#' @return Input data extended with output weights
#' 
#' @importFrom CalibrateSSB CalibrateSSB
#' @export
#' 
#' @examples
#' 
#' # Generates data  - two years
#' z    <- AkuData(3000)  # 3000 in each quarter
#' zPop <- AkuData(10000)[,1:7]
#' 
#' # Calibration using "survey"
#' a <- CalibrateSSBweights(z, calmodel = "~ sex*age",
#'                  partition = c("year","q"),  # calibrate within quarter
#'                  popData = zPop)
#'
CalibrateSSBweights <- function(data, ..., weightsname = "calWeights") {
  data[[weightsname]] <- CalibrateSSB(data, ...)$w
  data
}


# A function used by CalibrateSSBpanel2 below
List2frame <- function(x) {
  namesX <- NULL
  for (i in seq_along(x)) 
    namesX <- c(namesX, rep(names(x)[i], length(x[[i]])))
  namesX
  uX <- unlist(x)
  data.frame(term = namesX, text = names(uX), value = as.vector((uX)))
}


#' Calibration weighting and variance estimation for panel data
#' 
#' The function is similar to \code{\link{CalibrateSSBpanel}} but rewritten since the advanced original code is problematic to re-export.  
#' Output is combined into a data frame. The function combines 
#' \code{\link{CalibrateSSB}}, \code{\link{WideFromCalibrate}} and \code{\link{PanelEstimation}}
#' into a single function.
#'
#' @param data The gross sample data frame
#' @param ... Further arguments to CalibrateSSB including variables needed by WideFromCalibrate
#' @param numerator     Argument to PanelEstimation
#' @param denominator   Argument to PanelEstimation
#' @param linComb       Argument to PanelEstimation
#' @param linComb0      Argument to PanelEstimation
#' @param estType       Argument to PanelEstimation
#' @param leveragePower Argument to PanelEstimation
#' @param group         Argument to PanelEstimation
#' @param returnCov     Argument to PanelEstimation
#' @param usewGross     Argument to PanelEstimation
#'
#' @return Output from PanelEstimation combined into a data frame
#' 
#' @importFrom CalibrateSSB PanelEstimation
#' @importFrom CalibrateSSB CalibrateSSB
#' @importFrom CalibrateSSB WideFromCalibrate
#' @export
#' 
#'
#' @examples
#' z    <- AkuData(3000)  # 3000 in each quarter
#' zPop <- AkuData(10000)[,1:7]
#' lc <- rbind(CalibrateSSB::LagDiff(8,4),CalibrateSSB::PeriodDiff(8,4))
#' rownames(lc) <- c("diffQ1","diffQ2","diffQ3","diffQ4","diffYearMean")
#' CalibrateSSBpanel2(z, calmodel="~ sex*age", partition=c("year","q"), popData=zPop, 
#'        y=c("unemployed","workforce"), id="id", wave=c("year","q"),
#'        numerator="unemployed", linComb=lc)
#'        
CalibrateSSBpanel2 <- function(data, ..., numerator, denominator = NULL, linComb = NULL, linComb0 = NULL, estType = "robustModel", 
                              leveragePower = 1/2, group = NULL, returnCov = FALSE, usewGross = TRUE) {
  
  if(is.null(linComb))
    return(List2frame(PanelEstimation(WideFromCalibrate(CalibrateSSB(data, ...)), numerator = numerator, denominator = denominator, 
                             linComb0 = linComb0, estType = estType, leveragePower = leveragePower, group = group, 
                             returnCov = returnCov, usewGross = usewGross)))
  
  List2frame(PanelEstimation(WideFromCalibrate(CalibrateSSB(data, ...)), numerator = numerator, denominator = denominator, linComb = linComb, 
                                               linComb0 = linComb0, estType = estType, leveragePower = leveragePower, group = group, 
                                               returnCov = returnCov, usewGross = usewGross))
}

