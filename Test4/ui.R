## Test 2 - 1. April 2021

# Tutorial from this YouTube video: https://www.youtube.com/watch?v=tfN10IUX9Lo

# Shiny Theme Selector: https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# load packaged
library(shiny)

### READ: https://community.rstudio.com/t/avoid-temporary-error-messages-in-shiny-outputs-that-are-waiting-on-updateselectinput/9424/3



#Define UI
shinyUI(fluidPage(
  
  titlePanel(
    tags$h1("Voll-Sweet-Ometer")),
  
  sidebarPanel(
    tags$h3("Finde heraus, wer voll sweet ist. Yeah!"),
    textInput("txt1", "Wie heißt du?", ""),
    verbatimTextOutput("txtout"),
    width = 9),
  
  sidebarPanel(
    tags$h3("Wie viele Tage bist du alt?"),
    tags$h4("Gib jeweils die Zahl an."),
    textInput("day", "Tag", ""),
    textInput("month", "Monat", ""),
    textInput("year", "Jahr", ""),
    verbatimTextOutput("birthday_output"),
    width = 9)
) #navbarPage
) #fluidPage
