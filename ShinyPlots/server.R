
library(shiny)
library(dplyr)
library(stringr)
library(ggplot2)


shinyServer(function(input, output, session) {
  
  selected <- reactiveVal(rep(FALSE, nrow(mtcars)))
  
  observeEvent(input$plot_click, {
    clicked <- nearPoints(mtcars, input$plot_click, allRows = TRUE)$selected
    selected(clicked)
  })
  
  observeEvent(input$plot_brush, {
    brushed <- brushedPoints(mtcars, input$plot_brush, allRows = TRUE)$selected
    selected(brushed)
  })
  
  observeEvent(input$plot_reset, {
    selected(rep(FALSE, nrow(mtcars)))
  })
  

  output$plot <- renderPlot({
    mtcars$sel <- selected()
    ggplot(mtcars, aes(wt, mpg)) + 
      geom_point(aes(colour = sel))
  }, res = 96)
  

  
  output$mtcars_tbl <- renderTable({
 
    df <- brushedPoints(mtcars, input$plot_brush, xvar='wt',yvar='mpg')
    df
  })
  
  
})
