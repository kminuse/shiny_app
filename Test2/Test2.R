## Test 2 - 1. April 2021

# Tutorial from this YouTube video: https://www.youtube.com/watch?v=tfN10IUX9Lo

# Shiny Theme Selector: https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# load packaged
library(shiny)
library(shinythemes)


#Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage("My first app",
                           tabPanel("Navbar 1",
                                    sidebarPanel(
                                      tags$h3("Input:"),
                                      textInput("txt1", "Vorname:", ""),
                                      textInput("txt2", "Nachname:", ""),
                                      ), #sidebarPanel
                                    mainPanel(
                                      h1("Header 1"),
                                      h4("Output 1"),
                                      verbatimTextOutput("txtout"),
                                      ) # mainPanel
                                    ), #Navbar 1, tabPanel
                           tabPanel("Navbar 2", "This panel is intentionally left blank"),
                           tabPanel("Navbar 3", "This panel is intentionally left blank"),
                           #tabPanel(h4("About"),
                            #        includeMarkdown("learning.Rmd")),
  
  ) #navbarPage
) #fluidPage

# Define server function
server <- function(input, output) {
  output$txtout <- renderText({
    paste( input$txt1, input$txt2, sep = " ")
  })
}

# Create shiny object
shinyApp(ui = ui, server = server)

          