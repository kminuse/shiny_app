## Test 2 - 1. April 2021

# Tutorial from this YouTube video: https://www.youtube.com/watch?v=tfN10IUX9Lo

# Shiny Theme Selector: https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# load packaged
library(shiny)


#Define UI
shinyUI(fluidPage(
  
  titlePanel(
    tags$h1("Super-Sweet-O-Meter")),
  
  sidebarPanel(
    tags$h3("Find out how sweet someone is. Yeah!"),
    textInput("txt1", "What is your name?", ""),
    verbatimTextOutput("txtout"),
    width = 9),
  
  sidebarPanel(
    tags$h3("Find out on what weekday you were born. Yeah!"),
    tags$h4("Type in the number."),
    textInput("day", "Day", ""),
    textInput("month", "Month", ""),
    textInput("year", "Year", ""),
    verbatimTextOutput("birthday_output"),
    width = 9)
) #navbarPage
) #fluidPage
