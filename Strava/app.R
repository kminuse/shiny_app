### Strava API ###

df <- read.csv("df.csv", sep=";", header = T)

##### App UI #####

ui <- fluidPage(
    navbarPage("Running",
            fluidRow(
                column(3, style = "background-color:#F5F5F5;",
                       valueBoxOutput("total"),
                       valueBoxOutput("total_distance")
                       ) 
    )
)
)


##### App Server #####

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$total <- renderValueBox({valueBox(value=round(length(df$id)), subtitle=" Total Number of Runs", width=1)})
    output$total_distance <- renderValueBox({valueBox(value=round(sum(df$distance/1000)), subtitle=" Total Running Distance in km", width=1)})
    
}

# Run the application 
shinyApp(ui = ui, server = server)


