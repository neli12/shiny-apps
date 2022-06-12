library(shiny)
library(leaflet)
ui <- fluidPage(
  titlePanel('SOC Monitoring of agricultural lands'),
  sidebarLayout(
    sidebarPanel(
      h4(strong('Welcome to the SOC monitoring tool')),
      tags$hr(style="border-color: black"),
      h4(strong('Description')),
      p(h4("This platform serve as a tool for estimating soil organic carbon (SOC) stocks in agricultural systems. After estimating a baseline SOC stock map, it is posible to estimate changes in SOC stock over a defined period (for example, every two years)."
           )
        ),
      div(p(h4('Inside the platform you can find options for SOC mapping. You can choose between ML models and there is available a set of environmental covariates to use as predictors.'
      ))),
      tags$hr(style="border-color: black"),
      h4(strong('Instructions')),
      h4('1. Upload data'),
      h4("2. Choose environmental covariates"),
      h4("3. Run the model - Measure accuracy and uncertainty"),
      h4("4. Build a baseline SOC stock map"),
      h4("5. Prediction every two years, until the 8th year"),
      h4("6. Compare the differences in SOC stock during the period"),
      h4("7. Measure additionality/leakage"),
      h4("8. Make recommendations")
    ),
    mainPanel(
      navbarPage(
        title = "",
        tabPanel('Map', leafletOutput('map', width = "100%")),
        tabPanel(h4('Summary')),
        tabPanel(h4('Modeling')),
        tabPanel(h4('SOC changes')),
        tabPanel(h4('Recommendations'))
      ),
      br(),
      hr(),
      column(6,
             fileInput(
               inputId = 'filedata',
               label = 'Upload data. Choose csv file',
               accept = c('.csv'))
      ),
      column(6,
             fileInput(
               inputId = 'filemap',
               label = 'Upload map. Choose shapefile',
               multiple = TRUE,
               accept = c(".shp", ".dbf", ".sbn", ".sbx", ".shx", ".prj")))
    )
  )
)
server <- function(input, output) {
  output$map <- renderLeaflet({
    leaflet() %>%
      setView(0, 55, zoom = 5) %>%
      addTiles(group = 'Open Street Map')
  })
}

shinyApp(ui, server)







