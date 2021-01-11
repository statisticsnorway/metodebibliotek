#'Create markdown text
#'@param ssblist The current list of methds functions
#'@param tag The process numbers (GSBPM one decimal) to identify
#'@author Susie Jentoft
create_text <- function(ssblist, tag){
  for (i in 1:nrow(ssblist)){
    if (any(sapply(tag, grepl, ssblist$tags[i],fixed = T))){
      cat(paste0("The [", ssblist$function_name[i], "](", 
                 ssblist$url[i], ") function is written in ", 
                 ssblist$language[i], ". ", ssblist$description[i],"  \n"))
      
    }
  }
}



#'Input form for adding a function to Metodebibliotek
#'@return the function and its details are added to the data file and README and tabel files are rendered
metodebib_input <- function(){
  require(shiny)
  require(rmarkdown)
  shinyApp(
    ui = fluidPage(
      textInput("function_name", "What is the name of the function?"),
      radioButtons("language", "What is the langauge?",
                   c("R" = "R",
                     "Python" = "Python")),
      radioButtons("package", "Which methods package is it in?",
                   c("metodebibr" = "metodebibr",
                     "metodebibpy" = "metodebibpy")),
      textInput("export_package", "What is the name of the original package it is in?"),
      textInput("description", "Please give a short descrpition of the function"),
      textInput("ansvar", "Please write the person responsible for this function"),
      textInput("url", "Please give the url"),
      checkboxGroupInput("tags", "Which processes is it used in?",
                         c("Planlegge variabler" = "2.2",
                           "Planlegge ramme og utvalg" = "2.4",
                           "Planlegge klargjøring og analyse" = "2.5",
                           "Forberede datainnsamling" = "4.2",
                           "Integrere data" = "5.1",
                           "Klassifisere og kode" = "5.2",
                           "Editere og imputere" = "5.4",
                           "Beregne vektor" = "5.6"
                         )),
      actionButton("submit", "Submit"),
    ), 
    server = function(input, output) {
      observeEvent(input$submit, {
        ssblist <- read.csv("./SSBfuncs.csv") # Don't think this will work in package?
        newrow <- c(input$function_name, 
                    input$language,
                    input$package,
                    input$export_package,
                    input$description,
                    input$ansvar,
                    input$url,
                    paste(input$tags, sep = " "))
        newlist <- rbind(ssblist, newrow)
        write.csv(newlist, file = "./SSBfuncs.csv", row.names = F)
        render("./README.rmd", md_document(variant = "markdown_github"))
        render("./metodebib_tabell.Rmd",
               md_document(variant = "markdown_github"))
        stopApp()
      })
    }
  )
}


