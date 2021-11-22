
library(shiny)

shinyUI(fluidPage(


    titlePanel("UI Dinamico"),
    tabsetPanel(tabPanel("Ejemplo 1",
                         numericInput('min1',"limite inferior", value = 5),
                         numericInput('max1',"limite superior", value = 10),
                         sliderInput('slider1', 'Seleccione valor', min = 0, max = 15, value = 5)),
                tabPanel("Ejemplo 2",
                         sliderInput('s1', 'Seleccione valor', min = -5, max = 5, value = 0),
                         sliderInput('s2', 'Seleccione valor', min = -5, max = 5, value = 0),
                         sliderInput('s3', 'Seleccione valor', min = -5, max = 5, value = 0),
                         sliderInput('s4', 'Seleccione valor', min = -5, max = 5, value = 0),
                         actionButton('reset','Reiniciar')
                  
                         ),
                tabPanel("Ejemplo 3",
                         numericInput('n','corridas',value = 10),
                         actionButton('correr','correr')),
                tabPanel("Ejemplo 4",
                         numericInput('nvalue','valor',value = 0)
                         ),
                tabPanel("Ejemplo 5",
                         numericInput('celcius','temperatura en celcius', value = NA),
                         numericInput('farenheit', 'temperatura en farenheit', value = NA)
                         )
      
    )
    
   

   
))
