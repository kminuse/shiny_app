### Very first own app

# packages
library(shiny)

ui <- fluidPage(
  titlePanel("Welcome to my website"),
  sidebarLayout(
    sidebarPanel(
      textInput("name", "What is your name?")
    ),
    mainPanel(
      paste("Nice to meet you "),
            textOutput("name")
    )
  )
)

server <- shinyServer(function(input,output){
  output$name <- renderText({
    paste(input$name)
  })
})

shinyApp(ui=ui, server=server)