library(shiny)

ui <- fluidPage(
  textInput("txt", "What is your name?", ""),
  actionButton("save", label = "Vorname speichern")
)

server <- function(input, output, session) {
  
  global <- reactiveValues()
 
  
  observeEvent(input$save,{
    global$txt <- input$txt
    to_save <- reactiveValuesToList(global)
    list_old <- read.csv("saved.csv",sep=",", header=T)
    input_string <- c(input$txt)
    list_mod <- rbind(list_old, input_string)
    list_new <- write.csv(list_mod,"saved.csv")
    
    print(to_save)
    #print(list_old)
    print(input_string)
    #saveRDS(to_save, file = "saved.rds")
    #Sys.sleep(0.5)
    
    #loaded <- readRDS("saved.rds")
    #print(loaded$txt)
  })
  
}

shinyApp(ui, server)