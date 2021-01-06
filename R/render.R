# Render lists to Markdown documents for GithUb
library(rmarkdown)

# Render README
render("README.rmd", md_document(variant = "markdown_github"))

# render table
render("help/metodebib_tabell.Rmd",
       md_document(variant = "markdown_github"))
