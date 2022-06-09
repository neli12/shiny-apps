## Setting the App Layout
library(shiny)
## User interface
ui <- fluidPage(
  titlePanel('Pilot platform for SOC monitoring'),
  
  sidebarLayout(
    sidebarPanel(
      helpText('Display SOC maps. Baseline and predictions available.'),
      selectInput('var',
                  label = 'Choose the map to display',
                  choices = list("Baseline SOC",
                                 'SOC prediction of two years',
                                 'SOC prediction of four years',
                                 'SOC prediction of six years',
                                 'SOC prediction of eight years',
                                 'Uncertainty',
                                 'Additionality'),
                  selected = 'None')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Maps', imageOutput("myImage")),
        tabPanel('Summary', verbatimTextOutput("summary")),
        tabPanel('Table', tableOutput('table'))
    )
  )
)
)


## Server
server <- function(input, output) {
  output$myImage <- renderImage({
    list(src = 'www/example_map.png',
         height = 800, width = 600)
  }, deleteFile = F)
  }

shinyApp(ui = ui, server = server)
