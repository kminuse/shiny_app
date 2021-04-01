library(shiny)
library(shinythemes)
library(knitr)

# Define server function
shinyServer(function(input, output) {
  
  output$txtout <- renderText({
    
    paste(input$txt1, input$txt2, "ist voll sweet", sep = " ")
  })
  
  output$markdown <- renderUI({
    
    HTML(markdown::markdownToHTML(knit("learning.Rmd", quiet = TRUE)))
  })
  
})