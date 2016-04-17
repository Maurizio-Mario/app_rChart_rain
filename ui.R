library(shiny)
library(rCharts)
options(RCHART_LIB = 'polycharts')

shinyUI(fluidPage(

  titlePanel("Rain across the Alps"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        selectInput(inputId = 'station', lab = "Station",
                    choices = sort(as.character(dt$Weather_station)), 
                    selected = NULL),
        sliderInput(inputId = "year", lab = "Years:",
                    min = 1980,
                    max = 2011,
                    value = c(1980, 1985)),
        checkboxGroupInput(inputId = "data", lab = "Select",
                           choices = c("Mean temperature" = "meanTemp",
                                       "Precipitation" = "precipitation"))

    ),
    mainPanel(
        h4('Historical data'),
    plotOutput("chart1")
    )
  )
))
