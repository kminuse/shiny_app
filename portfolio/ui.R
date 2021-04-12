### Portfolio Shiny App ###

library(shiny)
library(markdown)
library(shinythemes)
library(ggplot2)
library(knitr)



# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("simplex"),
    
    navbarPage("Konstantin Escher",
               
#### Home ####  
               
               tabPanel("Home",
                  
                fluidRow(
                    column(3,
                           style = "background-color:#F5F5F5;",
                           h3("In a nutshell"),
                           br(),
                           p("I am a Social & Decision Making Psychologist based in Berlin."),
                           br(),
                           p("As Head of User Research at OneFootball, I lead a team of 9 professionals and support the company in defining and building products that people love to use."),
                           br(),
                           p("As a user researcher and psychologist, I help companies make smarter decisions with the help of qualitative and quantitative research on how to reach and excite their users, create a flawless product experience and understand how their offer fits into the lives of their audience.")
                           
                           
                           
                           ), 
                    
                    column(9,
                           h3("Get to know me better")),
                    
                  
                ), # fluidRow       
                  
                  
                  
                ), 

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
                        titlePanel("Shiny Basics")
                        #includeHTML("basics_of_shiny.html")
                        ),


#### Shiny Experiments: Dummy Data ####                     
                    tabPanel("Dummy Data",
                             fluidPage(
                               titlePanel("Shiny Experiments"),
                               
                          
                               fluidRow(
                                 column(4, 
                                        "Distribution 1",
                                        numericInput("n1", label = "n", value = 1000, min = 1),
                                        numericInput("mean1", label = "µ", value = 0, step = 0.1),
                                        numericInput("sd1", label = "σ", value = 0.5, min = 0.1, step = 0.1)
                                 ),
                                 column(4, 
                                        "Distribution 2",
                                        numericInput("n2", label = "n", value = 1000, min = 1),
                                        numericInput("mean2", label = "µ", value = 0, step = 0.1),
                                        numericInput("sd2", label = "σ", value = 0.5, min = 0.1, step = 0.1)
                                 ),
                                 column(4,
                                        "Frequency polygon",
                                        numericInput("binwidth", label = "Bin width", value = 0.1, step = 0.1),
                                        sliderInput("range", label = "range", value = c(-3, 3), min = -5, max = 5)
                                 )
                               ),
                               fluidRow(
                                 column(9, plotOutput("hist")),
                                 column(3, verbatimTextOutput("ttest"))
                               )
                             )
                             ),
            
#### Shiny Experiments: Runs on Strava ####    

                      tabPanel("Runs on Strava",
                               fluidPage(
                                titlePanel("Runs on Strava"),
                                
                                sidebarPanel(
                                  p("Lorem lorem")
                                )
                                
                                
                                )
                      )


                )


           
               
               
               
        
    ) # navbarPage
) # fluidPage
) # shinyUI