library(shiny)
library(rCharts)
library(xtable)
options(RCHART_LIB = 'nvd3')
options(RCHART_LIB = 'leaflet')

shinyUI(fluidPage(
    
    titlePanel("Alpine weather stations"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = 'station', lab = "Station:",
                        choices = sort(as.character(dt$Weather_station)), 
                        selected = NULL,
                        multiple = TRUE),
            sliderInput(inputId = "year", lab = "Years:",
                        min = 1980,
                        max = 2011,
                        value = c(1980, 1985)),
            radioButtons(inputId = "data", lab = "Select:",
                               choices = c("Mean temperature" = "meanTemp",
                                           "Precipitation" = "precipitation"),
                         selected = FALSE),
            submitButton("Go!"),
            checkboxInput(inputId = "stats", lab = "Summary statistics")
            
        ),
        mainPanel(
            tabsetPanel(
                tabPanel(
                    "History data",
                    showOutput("chart1", "nvd3"),
                    uiOutput("summary")
                ),
                tabPanel(
                    "Map",
                    tags$style('.leaflet {height: 400px;}'),
                    showOutput("chart2", "leaflet")
                )
            )
        )
    )
))