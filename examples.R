#### Render lists to Markdown documents for GithUb ####


#### Add new function with form ####
library(metodebibliotek)
metodebib_input()



#### Read in list ####
ssblist <- read.csv('./viz/SSBfuncs.csv')




#### Render README ####
library(rmarkdown)
render("./viz/README.Rmd", 
       output_file = "README.md",
       output_dir = "./",
       md_document(variant = "markdown_github"))

# render table
render("viz/metodebib_tabell.Rmd",
       md_document(variant = "markdown_github"))


#### Example of csv file ####
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
ansvar = c("Susie Jentoft", "Øyvind Langsrud", "Susie Jentoft" )
SSB_funcs <- data.frame(function_name, 
                        language, 
                        package, 
                        export_package, 
                        description,
                        ansvar,
                        url, 
                        tags
)

#write.csv(SSB_funcs, file = "viz/SSBfuncs.csv", row.names = F)


