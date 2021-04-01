## Test 2 - 1. April 2021

# Tutorial from this YouTube video: https://www.youtube.com/watch?v=tfN10IUX9Lo

# Shiny Theme Selector: https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# load packaged
library(shiny)

#Define UI
shinyUI(fluidPage(
  
  titlePanel("Voll-Sweet-ometer"),
  
  sidebarPanel(
    tags$h3("Wie heißt du?"),
    textInput("txt1", "Name:", "")
    ), #sidebarPanel
  sidebarPanel(
    h4("Finde heraus, wer voll sweet ist. Yeah!"),
    verbatimTextOutput("txtout")
    ) # mainPanel
                           
                ) #navbarPage
) #fluidPage
