### Portfolio Shiny App ###

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  freqpoly <- function(x1, x2, binwidth = 0.1, xlim = c(-3, 3)) {
    df <- data.frame(
      x = c(x1, x2),
      g = c(rep("x1", length(x1)), rep("x2", length(x2)))
    )
    
    ggplot(df, aes(x, colour = g)) +
      geom_freqpoly(binwidth = binwidth, size = 1) +
      coord_cartesian(xlim = xlim)
  }
  
  t_test <- function(x1, x2) {
    test <- t.test(x1, x2)
    
    # use sprintf() to format t.test() results compactly
    sprintf(
      "p value: %0.3f\n[%0.2f, %0.2f]",
      test$p.value, test$conf.int[1], test$conf.int[2]
    )
  }
  
    output$hist <- renderPlot({
      x1 <- rnorm(input$n1, input$mean1, input$sd1)
      x2 <- rnorm(input$n2, input$mean2, input$sd2)
      
      freqpoly(x1, x2, binwidth = input$binwidth, xlim = input$range)
    }, res = 96)
    
    output$ttest <- renderText({
      x1 <- rnorm(input$n1, input$mean1, input$sd1)
      x2 <- rnorm(input$n2, input$mean2, input$sd2)
      
      t_test(x1, x2)
    })
    
    output$markdown <- renderUI({
      HTML(markdown::markdownToHTML(knit('basics_of_shiny.Rmd', quiet = TRUE)))
    })
  
})
