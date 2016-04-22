library(shiny)
library(rCharts)
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
            checkboxGroupInput(inputId = "data", lab = "View:",
                               choices = c("Mean temperature" = "meanTemp",
                                           "Precipitation" = "precipitation")),
            checkboxInput(inputId = "stats", lab = "Summary statistics"),
            submitButton("Go!")
            
        ),
        mainPanel(
            h4("paste"),
            showOutput("chart1", "nvd3"),
            tableOutput("summary")
        )
    )
))