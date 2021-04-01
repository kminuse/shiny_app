library(shiny)

# Define server function
shinyServer(function(input, output) {

  output$txtout <- renderText({
    if (input$txt1 != "") {
      paste("Ey", input$txt1, "ist voll sweet!", sep = " ")
    }
  })
  
})