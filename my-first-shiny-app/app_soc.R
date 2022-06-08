## Setting the App Layout
library(shiny)
## User interface
ui <- fluidPage(
  titlePanel('Pilot platform for SOC monitoring'),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      img(src = 'C:/Users/neliq/Desktop/example_map.PNG', height = 500, width = 350)
    )
  )
)  


## Server
server <- function(input, output) { }

shinyApp(ui = ui, server = server)

