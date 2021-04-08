### Portfolio Shiny App ###

library(shiny)
library(markdown)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("simplex"),
    
    navbarPage("Konstantin Escher",

#### About Page ####                              
               tabPanel("About",
                        titlePanel("About"),
                        
                        
               ),


#### Blog Page ####                   
               tabPanel("Blog",
                        titlePanel("Blog"),
                        
                        
                ),
               
#### Learning Shiny Page ####                   
               tabPanel("Learning Shiny",
                        titlePanel("Learning Shiny"),
            
                )
               
               
               
        
    ) # navbarPage
) # fluidPage
) # shinyUI