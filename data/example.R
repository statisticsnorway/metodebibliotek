# example list for 

function_name = c("GetKlass", "PanelEstimation", "Dataset")
language = c("R", "R", "Python")
package = c("metodebibr", "metodebibr", "metodebibpy")
export_package = c("klassR", "CalibrateSSB", "pyjstat")
description <- c("Retrieves classifications and codelists from Klass",
                 "Variance estimation for panel data",
                 "Create class instance of a json dataset"
                 )
url = c("https://www.rdocumentation.org/packages/klassR/versions/0.1.2/topics/GetKlass",
        "https://www.rdocumentation.org/packages/CalibrateSSB/versions/1.3.0/topics/PanelEstimation",
        "https://pypi.org/project/pyjstat/"
        )
tags = c("2.2 7.2 5.2", "5.6", "4.3 5.1")
SSB_funcs <- data.frame(function_name, 
                        language, 
                        package, 
                        export_package, 
                        description,
                        url, 
                        tags)
write.csv(SSB_funcs, file = "data/SSBfuncs.csv", row.names = F)


### add function
add_ssb_function <- function(){
  library(svdialogs)
}

# Printing description
ssblist <- read.csv("data/SSBfuncs.csv")

create_text <- function(ssblist, tag){
  for (i in 1:nrow(ssblist)){
    if (any(sapply(tag, grepl, ssblist$tags[i]))){
      cat(paste0("The [", ssblist$function_name[i], "](", 
                 ssblist$url[i], ") function is written in ", 
                 ssblist$language[i], ". ", ssblist$description[i],"  \n"))
      
    }
  }
}

create_text(ssblist, tag = "5.3")

any(sapply("5.3", grepl, tags[2]))
cond(paste(grepl()))
grepl("5.3", tags) | grepl("5.6", tags)

for (i in 1:3){
  cat(paste0("The [", ssblist$function_name[i], "](", ssblist$url[i], ") function is written in ", ssblist$language[i], "  \n"))
}
  
# render
ssblist <- read.csv("data/ssbfuncs.csv")
library(rmarkdown)
render("README.rmd", md_document(variant = "markdown_github"))

