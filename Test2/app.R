## Test 2 - 1. April 2021

# Tutorial from this YouTube video: https://www.youtube.com/watch?v=tfN10IUX9Lo

# Shiny Theme Selector: https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# load packaged
library(shiny)
library(shinythemes)
library(knitr)


#Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage("Learning Shiny",
                           tabPanel("Navbar 1",
                                    sidebarPanel(
                                      tags$h3("Wie heißt du?"),
                                      textInput("txt1", "Vorname:", ""), # txt1 will be sent to the server
                                      textInput("txt2", "Nachname:", ""), # txt2 will be sent to the server
                                      ), #sidebarPanel
                                    mainPanel(
                                      h1("Voll-Sweet-ometer"),
                                      h4("Finde heraus, wer voll sweet ist. Yeah!"),
                                      verbatimTextOutput("txtout"), # txtout is generated from the server
                                      ) # mainPanel
                                    ), #Navbar 1, tabPanel
                           tabPanel("Navbar 2", "This panel is intentionally left blank"),
                           tabPanel("Navbar 3", "This panel is intentionally left blank"),
                           tabPanel("Documentation", 
                                  uiOutput("markdown")
                                ) #fluidPage    
  
  ) #navbarPage
) #fluidPage

# Define server function
server <- function(input, output) {
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, "ist voll sweet", sep = " ")
  })
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit("learning.Rmd", quiet = TRUE)))
  })
}

# Create shiny object
shinyApp(ui = ui, server = server)

          