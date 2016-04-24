library(shiny)
library(rCharts)
library(xtable)
options(RCHART_LIB = 'nvd3')

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
            checkboxInput(inputId = "stats", lab = "Summary statistics")
            
        ),
        mainPanel(
            h4("paste"),
            showOutput("chart1", "nvd3"),
            uiOutput("summary")
        )
    )
))