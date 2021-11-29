
library(shiny)

shinyUI(fluidPage(
  
  titlePanel('Tarea de Shiny'),
  h4('Scatterplot'),

  plotOutput("plot", click = "plot_click", brush = "plot_brush", dblclick = "plot_reset", hover = "plot_hover"),
  
  h4('Tabla'),
  
  tableOutput('mtcars_tbl'),
  
  verbatimTextOutput('test')
)
)
