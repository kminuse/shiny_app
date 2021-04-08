### Portfolio Shiny App ###

library(shiny)
library(markdown)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("simplex"),
    
    navbarPage("Konstantin Escher",

#### MENU About ####                              
               navbarMenu("About",

#### Resume ####                   
                          
                tabPanel("Resume",
                   titlePanel("Resume")),        

#### Contact ####                   

                tabPanel("Contact",
                    titlePanel("Contact"))    
                        
               ),


#### Blog ####                   
               tabPanel("Blog",
                        titlePanel("Blog")
                        
                        
                ),
               
#### MENU Learning Shiny #### 

                navbarMenu("Learning Shiny",


#### Shiny Basics #### 
                    tabPanel("Basics",
                        titlePanel("Shiny Basics")),


#### Shiny Experiments ####                     
                    tabPanel("Experiments",
                             titlePanel("Shiny Experiments"))
            
                )
               
               
               
        
    ) # navbarPage
) # fluidPage
) # shinyUI