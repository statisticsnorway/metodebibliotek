library(shiny)
library(rmarkdown)


ui <- fluidPage(
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
)

server <- function(input, output) {
  observeEvent(input$submit, {
    ssblist <- read.csv("./../data/SSBfuncs.csv")
    newrow <- c(input$function_name, 
                input$language,
                input$package,
                input$export_package,
                input$description,
                input$ansvar,
                input$url,
                paste(input$tags, sep = " "))
    newlist <- rbind(ssblist, newrow)
    write.csv(newlist, file = "./../data/SSBfuncs.csv", row.names = F)
    render("./../README.rmd", md_document(variant = "markdown_github"))
    render("./../help/metodebib_tabell.Rmd",
           md_document(variant = "markdown_github"))
    stopApp()
  })

}

shinyApp(ui, server)

