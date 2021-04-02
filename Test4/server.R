library(shiny)

# Define server function

shinyServer(function(input, output) {

  output$txtout <- renderText({
    if (input$txt1 != "") {
      paste("Ey", input$txt1, "is super sweet!", sep = " ")
    }
  })
  
  output$birthday_output <- renderText({
    if (input$day != "" && input$month != "" && input$year != "") {
      birthday_input <- paste(input$year,"-",input$month,"-",input$day, sep="") 
      start <- as.Date(birthday_input, tryFormats = c("%Y-%m-%d", "%YYYY-%mm-%dd"))
      end <- as.Date(Sys.Date())
      difference <- end-start
      weekday <- weekdays(start)
      
      paste("You are" ,difference, "days young. Super sweet!","You were born on a",weekday,":-)")
    } else {
      print("")
    }
  })
})